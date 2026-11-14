Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672159;
	b=3er3DsvuANuOxDwOkmQN8geX2GArU/+6FzPUb6D8O6FYr1fy/9OoMOLI5XuIbYBcLbmL
	 hLKhw55G2qedfaJUyMAL1IRmz7zL5+ob2lml8YIZ3qpcQMGwYYnJfuRbOw3jkrbnSzOlF
	 13LJRFhjMzkNzWvtBI5AEU3PuEXFhh+Ub7nIqZb+kBYbUMatutDdGUfFYVFmcW/MvF8qQ
	 ijlV1X+j/3jxlie8oBmH1CRaCCmgYjKHCWzpRLj91F+iB4pX0PKPFrkh4AWs7JzI//pHb
	 eCq+sK+NvFPJxS9NY/aWgFZePiPRK6m6JjuqcyuYIM7sH5SYkzq12rcr5TOEOXA+oRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MprJBhH8IjHCr2vOCfVSYowKiGsQhRGImfmMUR1eCcE=;
	b=Mtebo3g/rE6Dvboe6B5NcSIrUo472QmKk81+dCN4hqTJSSK2lS18/Urj2MKwMkK/9A6W
	 yZPNSiPkM1bkKMt/ugw/p3bJ9Yn09SqdTqNMj9WSweWrK0Vz/UD9kt7pZFjEDDrFYgePy
	 1r+/EPVm4eQI5YCh0CHwnnOqI2tUD5zFfHywpMbu3d2t74zbZWgtIePRajZ2r5KWnjaHj
	 hVrf36CnENlwBKHAz1uuq6ccrGKo/ukzTcQvqLeB4OQAiu3ou1+NyY6gJRsb1iLzFf+82
	 Cb842iOQSut5Nf8NqbeUNbzU8lAERCdEnpgs2qVzwaCpCQVHynzXc4WqDBwcjZdgVFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=omnibond.com;
	spf=pass smtp.mailfrom=omnibond.com;
	dkim=pass header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b=Qny3S3aQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6A606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 16:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b=Qny3S3aQ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso892198a12.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672158; cv=none;
        d=google.com; s=arc-20260327;
        b=T3tiFxNLp7utTe3ybbxCmACcvSmxgXbG2yxU3hixN/NW27dONptOaAXcrb5eDzW1P6
         r3uPFZiIoSoFnIYaF/hd3VuLD2ibsPh5jAGTAqd9VYRgfzF1r4wR42YR1Ck89/XHOa+k
         10vvZHLYNqACcsQFj3Mg9JShMzCGZKf7qpf/1fzYpAjGuufnBwKVpQdXNBf0pLnYtcM2
         zysvslY4BBujiQoQB2ESgEp9+f/WaFdtKZrLuwO+Z7rFeVTl7o5h8+3uugpSh+YpAtMd
         WKe+Wa9azYXSYUgUge8+R208wHYHja3jPDeM/slp5HSMR9liyDoQmUX1P0bP9semQzO0
         MfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MprJBhH8IjHCr2vOCfVSYowKiGsQhRGImfmMUR1eCcE=;
        fh=bQH5cVqupk3QLnVCp3R9ZxudnATx789g9SIdBZwxX1k=;
        b=O1ah5eoQ7bDZgzc0iIa0rd36yfjp4K5LGBS/MOI7hIpcQ8t7cHBOjWIZWPlY3iwNqh
         t1gUJUH8m5E4Fzbst103pEeLKjTQnXwWhFxtlu5nslr4S8kqIN6GVCgAtPNhhJ4LO0is
         4OZVyEpmavlsOeyJIu2n8Bx0OBB2ULo+rdY/R5WP6hdH8DpewtYuZsmCYE0tVYyAiX5N
         krNXo1/PF+j/UvzY00ZUjUpVmgL52iw4T+Qtn5O85WOrEUd22Jo5UZL86z8e0uva4nd7
         OPa+2/hLC+Zu1oQ+zL3naL8EaZP/IPlcZFVa6fipM9CcCJdvdEDsiu2Y1K7Vmv0YBuTw
         ldbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond.com; s=google; t=1794672158; x=1795276958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MprJBhH8IjHCr2vOCfVSYowKiGsQhRGImfmMUR1eCcE=;
        b=Qny3S3aQvZnxtGCbly8Os4EoweNyVK1bs8qjTHfOwIe0tDf+GSJBYDwjRbmIZg0Qgl
         xSTJOg1i/nxdy0GDCrW0Rq/gWmWORtQRICUF0sitVBJalArfaai47e0g5RO2OUP6pTdv
         mzj0dseTxeOpTbe29Kib3wCaZze1yD7gjofN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672158; x=1795276958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MprJBhH8IjHCr2vOCfVSYowKiGsQhRGImfmMUR1eCcE=;
        b=lKT4KhHCKrtnQfkx6jaheHMca4JLhWU8mBSDrm8JjAvR7QkZIoaktGAJWdAAjY0Y67
         W761L8XCwiEkxcIozttLVwjtqvu8t3h0SyY0RjMgWGqGGqPijWnEP1mCgYu3pdgiLvZ8
         FJv8QIVYgWWIkPU4J2QSKMrfW5O0YXafaHhJWTTG5mlTYZhCHnLxCV/xxS2NBhC+nsC9
         xK8IX3DYxFN+2cYLd0Q426GxU1kax70XifCWFLXMF4AAbGaWhNGumP8anhNr7JZiOZZA
         xY4Xp6kY0YzoWKlJZEQKPfHKLCt7l4Zhm+pQU+UFyye/9IxGSN83ZPBtwUGt7bpg4vN2
         LsqQ==
X-Gm-Message-State: APuU4Z+59bxyOtDFm9PTGyocL5PF2AHkUOuiMhvimLrxsp1aqVXRMUCL
	W+Cy8LHCz66IB1EM5j93cDbOIHiLLjF8ouk+HVifzI/DBnNZ1EuT+0rIXRcwnssRO7OqF7AzDXC
	nVZeLO4wtR5xvhw37OcVAKNs6Smevvw0uY4y/o3Xk
X-Gm-Gg: AYBFou048kcL+qIb7QicmKRUc1nIegHLKWExDwJDq6nEclSPlvdhBGL8+VAN2vheA0T
	ItnsZo4r9K4Ya00aBTQrUmFphVbhh3/boXI8tD9rA/eSW9jxzYjA9gAM+OjVSyDDXYrooKfjLtq
	v8vh1NGIyz4QmaMZA8lGxg4lyHuDhlgrOw4NHV0d3rubLoa/iOdhBlO3LsoOShrj7+TYoMxYCIU
	8TRA9W7ZC9af0ovrOCYKobpMe7bFilPGFIPSzZC3iPl45yHw0ul3vPO/2oLrGbArJ8Yz0o6u16j
	gwoQaskq2/M6HTGsCsw4ZrsLWAxFdiGQ0fJN5yzNfRPzylCnGIhI3GysAPhdLydlFQLLLhTPiiT
	nyunlo/NnSyNIGjeMOe6y8OciibAp9LpD8cchMRlo2PHY2I+k
X-Received: by 2002:a17:90a:c2c8:b0:3ac:a11a:7c8d with SMTP id
 98e67ed59e1d1-3b1b0b5e4e3mr5529866a91.59.1794672158207; Sat, 14 Nov 2026
 08:02:38 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113083336.15152-1-jack@suse.cz> <20261113084700.739002-16-jack@suse.cz>
 <sashiko-outbox-212490@kernel.org> <6vifbr2gkvxhq2rer5agf6jwy3lrsjqpkxcrfdnypjqqjao4uw@j2al5rnaailb>
In-Reply-To: <6vifbr2gkvxhq2rer5agf6jwy3lrsjqpkxcrfdnypjqqjao4uw@j2al5rnaailb>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 14 Nov 2026 11:02:27 -0500
X-Gm-Features: AclHuK8w0nFYPcNdJvOGfFrUolQ8uILgHyz1m2idTjqCICOoU3cjJ06FvFk0mYY
Message-ID: <CAOg9mSQYDoH0ASc_HCgR=oZrGa1r=wy5OuS9qwX5arjd0bKP1w@mail.gmail.com>
Subject: Re: [PATCH 03/13] orangefs: Check PAGECACHE_TAG_DIRTY instead of
 I_DIRTY_PAGES inode state
To: Jan Kara <jack@suse.cz>
Cc: sashiko-reviews@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, 
	Dave Kleikamp <shaggy@kernel.org>, Carlos Maiolino <cem@kernel.org>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, 
	Anna Schumaker <anna@kernel.org>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I worked through Jan's patch and sashiko-bot's review
with grok build, and came up with this... If what I've
got here passes muster, I'm thinking Jan should still
be marked as Author: and Signed-off-by:  it is his patch
with a little change, but I wouldn't want to attribute
anything to him that he doesn't want attributed, so
let me know... My version probably won't feed through
"git am" since I'm using gmail. I'm not sure how to add
a message to a thread with "git send-email", even
when I add in the message-id...


PAGECACHE_TAG_DIRTY is the authoritative source of dirty folios.
I_DIRTY_PAGES can stay set after filemap_fdatawrite(), which is how
orangefs_flush() and orangefs_fsync() write the mapping, so a getattr
keeps serving the cached inode after the folios are clean.

The dirty tag alone is not enough. folio_start_writeback() clears it
and sets PAGECACHE_TAG_WRITEBACK before wait_for_direct_io() sends the
write. OrangeFS writepages does not return until that call finishes, so
I_DIRTY_PAGES still covers the round trip today. A getattr that looks
only at the dirty tag stores the server's old size while the write is
in flight. orangefs_writepage_locked() then reads that size and shortens
the write.

Hold the cached attributes while either tag is set.


---
 fs/orangefs/orangefs-utils.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/fs/orangefs/orangefs-utils.c b/fs/orangefs/orangefs-utils.c
index 9ab1119ebd28..72fa9865bb86 100644
--- a/fs/orangefs/orangefs-utils.c
+++ b/fs/orangefs/orangefs-utils.c
@@ -233,6 +233,20 @@ static int orangefs_inode_is_stale(struct inode *inode=
,
  return 0;
 }

+/*
+ * Dirty and writeback tags, not I_DIRTY_PAGES. filemap_fdatawrite()
+ * leaves that flag set after the folios are clean. folio_start_writeback(=
)
+ * clears the dirty tag before wait_for_direct_io() returns, so the
+ * writeback tag is what covers the server write.
+ */
+static bool orangefs_writeback_pending(struct inode *inode)
+{
+ struct address_space *mapping =3D inode->i_mapping;
+
+ return mapping_tagged(mapping, PAGECACHE_TAG_DIRTY) ||
+       mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK);
+}
+
 int orangefs_inode_getattr(struct inode *inode, int flags)
 {
  struct orangefs_inode_s *orangefs_inode =3D ORANGEFS_I(inode);
@@ -247,7 +261,8 @@ again:
  spin_lock(&inode->i_lock);
  /* Must have all the attributes in the mask and be within cache time. */
  if ((!flags && time_before(jiffies, orangefs_inode->getattr_time)) ||
-    orangefs_inode->attr_valid || inode_state_read(inode) & I_DIRTY_PAGES)=
 {
+    orangefs_inode->attr_valid ||
+    orangefs_writeback_pending(inode)) {
  if (orangefs_inode->attr_valid) {
  spin_unlock(&inode->i_lock);
  write_inode_now(inode, 1);
@@ -281,13 +296,14 @@ again2:
  spin_lock(&inode->i_lock);
  /* Must have all the attributes in the mask and be within cache time. */
  if ((!flags && time_before(jiffies, orangefs_inode->getattr_time)) ||
-    orangefs_inode->attr_valid || inode_state_read(inode) & I_DIRTY_PAGES)=
 {
+    orangefs_inode->attr_valid ||
+    orangefs_writeback_pending(inode)) {
  if (orangefs_inode->attr_valid) {
  spin_unlock(&inode->i_lock);
  write_inode_now(inode, 1);
  goto again2;
  }
- if (inode_state_read(inode) & I_DIRTY_PAGES) {
+ if (orangefs_writeback_pending(inode)) {
  ret =3D 0;
  goto out_unlock;
  }

On Fri, Nov 13, 2026 at 5:34=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Fri 13-11-26 09:00:01, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [High] orangefs: stale i_size overwrite during writeback in
> >   orangefs_inode_getattr()
>
> ...
>
> > > diff --git a/fs/orangefs/orangefs-utils.c b/fs/orangefs/orangefs-util=
s.c
> > > index 9ab1119ebd28a..4c4036f470cdd 100644
> > > --- a/fs/orangefs/orangefs-utils.c
> > > +++ b/fs/orangefs/orangefs-utils.c
> > > @@ -247,7 +247,8 @@ int orangefs_inode_getattr(struct inode *inode, i=
nt flags)
> > >     spin_lock(&inode->i_lock);
> > >     /* Must have all the attributes in the mask and be within cache t=
ime. */
> > >     if ((!flags && time_before(jiffies, orangefs_inode->getattr_time)=
) ||
> > > -       orangefs_inode->attr_valid || inode_state_read(inode) & I_DIR=
TY_PAGES) {
> > > +       orangefs_inode->attr_valid ||
> > > +       mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY)) {
> > >             if (orangefs_inode->attr_valid) {
> > >                     spin_unlock(&inode->i_lock);
> > >                     write_inode_now(inode, 1);
> > > @@ -281,13 +282,14 @@ int orangefs_inode_getattr(struct inode *inode,=
 int flags)
> > >     spin_lock(&inode->i_lock);
> > >     /* Must have all the attributes in the mask and be within cache t=
ime. */
> > >     if ((!flags && time_before(jiffies, orangefs_inode->getattr_time)=
) ||
> > > -       orangefs_inode->attr_valid || inode_state_read(inode) & I_DIR=
TY_PAGES) {
> > > +       orangefs_inode->attr_valid ||
> > > +       mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY)) {
> > >             if (orangefs_inode->attr_valid) {
> > >                     spin_unlock(&inode->i_lock);
> > >                     write_inode_now(inode, 1);
> > >                     goto again2;
> > >             }
> > > -           if (inode_state_read(inode) & I_DIRTY_PAGES) {
> > > +           if (mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY)=
) {
> > >                     ret =3D 0;
> > >                     goto out_unlock;
> > >             }
> >
> > [Severity: High]
> > Can orangefs_inode_getattr() overwrite inode->i_size with a stale size =
from
> > the server while pagecache writeback is in flight?
> >
> > When a buffered write extends a file in orangefs_write_end(), inode->i_=
size
> > is updated in memory and the folio is marked dirty, while the server on=
ly
> > learns the new size once the writeback RPC in wait_for_direct_io()
> > completes.  Previously, I_DIRTY_PAGES stayed set in
> > __writeback_single_inode() across the entire do_writepages() call.
> > However, folio_start_writeback() clears PAGECACHE_TAG_DIRTY and sets
> > PAGECACHE_TAG_WRITEBACK before wait_for_direct_io() sends the write to =
the
> > server:
> >
> > CPU0                                  CPU1
> > orangefs_writepage_locked()
> >   folio_start_writeback(folio)
> >     /* clears PAGECACHE_TAG_DIRTY,
> >        sets PAGECACHE_TAG_WRITEBACK */
> >                                       orangefs_getattr()
> >                                         orangefs_inode_getattr(...,
> >                                             ORANGEFS_GETATTR_SIZE)
> >                                           /* PAGECACHE_TAG_DIRTY is fal=
se */
> >                                           service_operation(GETATTR)
> >                                           inode->i_size =3D ...; <-- st=
ale size
> >   len =3D i_size_read(inode);
> >   wait_for_direct_io(ORANGEFS_IO_WRITE, ...)
>
> Yeah, that's a good catch but I think that this is pre-existing issue. Wh=
en
> we don't wait for writeback to complete in __writeback_single_inode()
> (which happens for sync(2) or for WB_SYNC_NONE writeback), we can clear
> I_DIRTY_PAGES before writeback completes as well. So this patch just make=
s
> the race window larger.
>
> But I agree with adding a check for PAGECACHE_TAG_WRITEBACK into the
> conditions as well to close the race window altogether. Another option
> would be to sample i_size before calling folio_start_writeback() but I fi=
nd
> that too subtle, it would require some barriers etc., so I won't do that
> unless orangefs guys insist.
>
>                                                                 Honza
>
> >
> > As a result, any concurrent getattr with non-zero flags (such as
> > orangefs_getattr() or orangefs_file_llseek()) fetches the pre-write siz=
e
> > from the server and clobbers inode->i_size, which also causes
> > orangefs_writepage_locked() (or a subsequent batch in
> > orangefs_writepages_work()) to clamp the write length to the stale size=
 and
> > truncate the buffered write.
> >
> > Should these checks also test mapping_tagged(inode->i_mapping,
> > PAGECACHE_TAG_WRITEBACK) (or mapping_writably_mapped() / a helper cover=
ing
> > both PAGECACHE_TAG_DIRTY and PAGECACHE_TAG_WRITEBACK)?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113083336.=
15152-1-jack@suse.cz?part=3D3
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
