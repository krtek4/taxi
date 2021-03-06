from __future__ import unicode_literals

import os
import shutil
import tempfile

from freezegun import freeze_time

from . import CommandTestCase


class StatusCommandTestCase(CommandTestCase):
    @freeze_time('2014-01-20')
    def test_status_previous_file(self):
        tmp_entries_dir = tempfile.mkdtemp()
        config = self.default_config.copy()

        os.remove(self.entries_file)

        self.entries_file = os.path.join(tmp_entries_dir, '%m_%Y.txt')
        config['default']['file'] = self.entries_file

        with freeze_time('2014-01-01'):
            self.write_entries("""01/01/2014
alias_1 1 january
""")

        with freeze_time('2014-02-01'):
            self.write_entries("""01/02/2014
alias_1 1 february
""")

            stdout = self.run_command('status', config_options=config)
        shutil.rmtree(tmp_entries_dir)

        self.assertIn('january', stdout)
        self.assertIn('february', stdout)

    @freeze_time('2014-01-20')
    def test_local_alias(self):
        config = self.default_config.copy()
        config['default']['local_aliases'] = '_pingpong'

        self.write_entries("""20/01/2014
_pingpong 0800-0900 Play ping-pong
""")
        stdout = self.run_command('status', config_options=config)

        self.assertIn(
            "_pingpong (local)              1.00  Play ping-pong",
            stdout
        )

    @freeze_time('2014-01-20')
    def test_multiple_local_aliases(self):
        config = self.default_config.copy()
        config['default']['local_aliases'] = '_pingpong, _coffee'

        self.write_entries("""20/01/2014
_pingpong 0800-0900 Play ping-pong
_coffee 0900-1000 Drink some coffee
""")

        stdout = self.run_command('status', config_options=config)
        self.assertIn(
            "_pingpong (local)              1.00  Play ping-pong",
            stdout
        )
        self.assertIn(
            "_coffee (local)                1.00  Drink some coffee",
            stdout
        )

    @freeze_time('2014-01-20')
    def test_regrouped_entries(self):
        self.write_entries("""20/01/2014
alias_1 0800-0900 Play ping-pong
alias_1 1200-1300 Play ping-pong
""")

        stdout = self.run_command('status')
        self.assertIn(
            "alias_1 (123/456)              2.00  Play ping-pong",
            stdout
        )

    @freeze_time('2014-01-20')
    def test_status_ignored_not_mapped(self):
        self.write_entries("""20/01/2014
unmapped? 0800-0900 Play ping-pong
""")

        stdout = self.run_command('status')
        self.assertIn(
            "unmapped (ignored)             1.00  Play ping-pong",
            stdout
        )
