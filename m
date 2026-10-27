Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.191.123.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081919;
	b=rPQB2/ccdFUKaydNJdWXALMQI0Zh3+dg17kIb8uWLulX3jOoSDCEDkx/z1rvzGECeSNS
	 mi//P3ZHQdH9zJTUeb52HYPHx8FZGgcMBmFJZ1qUzp1aViTYhNpcOKo6UnjVrRJWrgMtq
	 3cPZU7c3PoIwyCXwVqCGeMqhDrSIfQR0lY3zD2nYbsUltu24IQRHG+SAzdsXAkgMO4dig
	 OynvMdoimyfZhQ3OmP8lzB8BljkTtQQMl6+z3TtNzT1qoKO69j2XWKPvcJ0Ae7cGHm60w
	 Z/fzdJN3uWoF/2LL32WWEC9aCfv/duO1CV/ghB2d+yDQZSJkdrUXOJ/zq4yjSw/0HnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081919;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=/WPE/EG+6Hw4ycoQLVOKDqDhtqCh+n3/n7fQNRLo9W0=;
	b=sweu7PaW9KWLdWhOI8cKKwrOgErxvSXoocXzs4AHKWzNAYpzxvkn2Hw9Ws/WZTFfy1d7
	 QQ6jCM54KL2UOe50GGayqI7Qfc/cWtvY9YriQhNRCC9wDcKUIF3SpNECs0ZmcjLbwRC/l
	 9xSELHwm9ZsYusuJqCuRmr0C0R3JDkecPPUtD1vUUhf07qoyuY6y/bSkPUCz4A8+5Q1+n
	 Yfn2qUymwAE2EcW6ALwKuvKq/xsWMLZsrW18HD0QrQY0nIQrqC7lIbCCrOiURFKSvGt3x
	 J389C6ewRqP105NHX0KaTkG/ApPvcaypZa13o4svR2CU0zNIJVIY8GVX+eq1B0UN47A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=h3c.com;
	spf=pass smtp.mailfrom=h3c.com;
	arc=none smtp.remote-ip=60.191.123.56
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8A606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 06:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69R6IEec044318;
	Tue, 27 Oct 2026 14:18:14 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 9F7642284EA2;
	Tue, 27 Oct 2026 14:21:35 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Tue, 27 Oct 2026 14:18:05 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <chengzhihao1@huawei.com>
CC: <lin.nan@h3c.com>, <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
        <zhou.kete@h3c.com>
Subject: [PATCH v4] ubifs: zero stale data beyond EOF before file size grows
Date: Tue, 27 Oct 2026 14:10:31 +0800
Message-ID: <20261027061031.3502472-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
References: <0f05834a-7483-3e4e-0612-1d70e045b893@huawei.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 69R6IEec044318

>> mmap writes can dirty the page cache beyond EOF without changing=0D
>> i_size. A later extending write or ftruncate turns that region into a=0D
>> hole, but UBIFS never zeroes the partial page at the old EOF, so reads=0D
>> expose the stale data.=0D
>> =0D
>> Zero the tail of the cached old-EOF folio in both size-extending=0D
>> paths: ubifs_write_iter() for writes starting beyond EOF, and=0D
>> do_setattr() before truncate_setsize() grows the size. This mirrors=0D
>> what ext4 does on size extension;=0D
>> =0D
>> Restructure ubifs_write_iter() to match ext4_buffered_write_iter():=0D
>> acquire inode_lock, perform write checks, call kiocb_modified() for=0D
>> setuid/setgid clearing, update mtime/ctime via update_mctime()=0D
>> (UBIFS sets S_NOCMTIME so VFS time updates short-circuit), zero the=0D
>> EOF hole, then execute the write with generic_perform_write(). This=0D
>> ensures proper serialization and security handling.=0D
>> =0D
>> All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping=0D
>> the folio_lock -> ui_mutex order of ->writepage(); the reverse order=0D
>> deadlocks.=0D
>> =0D
>> UBIFS does not enable large folios, so the EOF folio is always a=0D
>> single page today; nevertheless, use folio-relative arithmetic=0D
>> (offset_in_folio(), folio_contains(), folio_size()) throughout so the=0D
>> code is correct if that ever changes.=0D
>> =0D
>> Signed-off-by: Nan Lin <lin.nan@h3c.com>=0D
>> =0D
>> Changes since v3:=0D
>>   - Add inode_lock and move zero-eof after generic_write_checks(),=0D
>>     matching ext4_buffered_write_iter structure=0D
>>     (suggested by Sashiko AI review & Zhihao Cheng).=0D
>>   - Add kiocb_modified() for setuid/setgid clearing.=0D
>>   - Keep explicit update_mctime() as UBIFS sets S_NOCMTIME.=0D
>> =0D
>> Changes since v2:=0D
>>   - Move the extending-write check from ubifs_write_begin() to=0D
>>     ubifs_write_iter(), mirroring ext4_write_checks() ->=0D
>>     ext4_block_zero_eof(): the hole zeroing runs once per write()=0D
>>     syscall instead of once per ->write_begin() iteration (suggested=0D
>>     by Zhihao Cheng).=0D
>>   - Drop the ubifs_vm_page_mkwrite() zeroing: like ext4=0D
>>     (ext4_block_write_begin() with len =3D i_size - folio_pos),=0D
>>     ->page_mkwrite() does not zero the tail beyond EOF, and mmap=0D
>>     writes past EOF are the user's responsibility (suggested by=0D
>>     Zhihao Cheng).=0D
>> =0D
>> Changes since v1:=0D
>>   - Both zeroing sites used PAGE_SIZE-relative arithmetic=0D
>>     (offset_in_page()-style) while folio_zero_range() expects=0D
>>     folio-relative offsets. UBIFS does not currently enable large=0D
>>     folios, so PAGE_SIZE =3D=3D folio_size() and the two coincide in=0D
>>     practice, but switch to offset_in_folio()/folio_size() anyway so=0D
>>     the code is correct if UBIFS ever opts into large folios=0D
>>     (suggested by Sashiko AI review).=0D
>> ---=0D
>>   fs/ubifs/file.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++---=
=0D
>>   1 file changed, 82 insertions(+), 4 deletions(-)=0D
>> =0D
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c=0D
>> index e73c28b12f97..6f2c83b6f433 100644=0D
>> --- a/fs/ubifs/file.c=0D
>> +++ b/fs/ubifs/file.c=0D
>> @@ -202,6 +202,45 @@ static void release_existing_page_budget(struct ubi=
fs_info *c)=0D
>>   	ubifs_release_budget(c, &req);=0D
>>   }=0D
>>   =0D
>> +/**=0D
>> + * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.=0D
>> + * @inode: inode whose size is about to grow=0D
>> + * @new_end: new end of the file, only used to bound the tail=0D
>> + *=0D
>> + * Zero the cached folio containing the old EOF for [old EOF,=0D
>> + * min(folio end, @new_end)) so a size extension does not expose stale=
=0D
>> + * data left beyond EOF by mmap writes.=0D
>> + *=0D
>> + * Must be called with inode_lock(inode) held and without ui->ui_mutex =
held:=0D
>> + * we block on the old-EOF folio lock, and ->writepage() and ->page_mkw=
rite()=0D
>> + * hold that folio lock while taking ui_mutex; the reverse order deadlo=
cks.=0D
>> + */=0D
>> +static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)=0D
>> +{=0D
>> +	loff_t old_size =3D i_size_read(inode);=0D
>> +	size_t from, to;=0D
>> +	struct folio *folio;=0D
>> +=0D
>> +	if (new_end <=3D old_size)=0D
>> +		return;=0D
>> +=0D
>> +	folio =3D filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT)=
;=0D
>> +	if (IS_ERR(folio))=0D
>> +		return;=0D
>> +=0D
>> +	from =3D offset_in_folio(folio, old_size);=0D
>> +	if (!from)=0D
>> +		goto out;=0D
>> +	to =3D folio_contains(folio, new_end >> PAGE_SHIFT) ?=0D
>> +	     offset_in_folio(folio, new_end) : folio_size(folio);=0D
>> +	if (to > from)=0D
>> +		folio_zero_range(folio, from, to - from);=0D
>> +=0D
>> +out:=0D
>> +	folio_unlock(folio);=0D
>> +	folio_put(folio);=0D
>> +}=0D
>> +=0D
>>   static int write_begin_slow(struct address_space *mapping,=0D
>>   			    loff_t pos, unsigned len, struct folio **foliop)=0D
>>   {=0D
>> @@ -1220,6 +1259,10 @@ static int do_setattr(struct ubifs_info *c, struc=
t inode *inode,=0D
>>   =0D
>>   	if (attr->ia_valid & ATTR_SIZE) {=0D
>>   		dbg_gen("size %lld -> %lld", inode->i_size, new_size);=0D
>> +=0D
>> +		/* Must run before the size change loses the old boundary. */=0D
>> +		ubifs_zero_eof_hole(inode, new_size);=0D
>> +=0D
>>   		truncate_setsize(inode, new_size);=0D
>>   	}=0D
>>   =0D
>> @@ -1433,11 +1476,46 @@ static int update_mctime(struct inode *inode)=0D
>>   =0D
>>   static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *f=
rom)=0D
>>   {=0D
>> -	int err =3D update_mctime(file_inode(iocb->ki_filp));=0D
>> -	if (err)=0D
>> -		return err;=0D
>> +	struct inode *inode =3D file_inode(iocb->ki_filp);=0D
>> +	ssize_t ret;=0D
>> +=0D
>> +	if (iocb->ki_flags & IOCB_NOWAIT)=0D
>> +		return -EOPNOTSUPP;=0D
>> +=0D
>> +	inode_lock(inode);=0D
>> +=0D
>> +	ret =3D generic_write_checks(iocb, from);=0D
>> +	if (ret <=3D 0)=0D
>> +		goto out;=0D
>> +=0D
>> +	ret =3D kiocb_modified(iocb);=0D
>> +	if (ret)=0D
>> +		goto out;=0D
>Hi,=0D
>I think file_remove_privs() is enouth, because ubifs inode has =0D
>S_NOCMTIME flag and the iocb->ki_flags without 'IOCB_NOWAIT'.=0D
=0D
Ack, This makes the code clearer.=0D
I'll make this change in the next revision.=0D
=0D
>>   =0D
>> -	return generic_file_write_iter(iocb, from);=0D
>> +	/*=0D
>> +	 * UBIFS sets S_NOCMTIME on all inodes, so VFS's file_update_time_flag=
s()=0D
>> +	 * short-circuits and never calls ubifs_update_time() for mtime/ctime.=
=0D
>> +	 * We must call update_mctime() explicitly here.=0D
>> +	 */=0D
>> +	ret =3D update_mctime(inode);=0D
>> +	if (ret)=0D
>> +		goto out;=0D
>> +=0D
>> +	/*=0D
>> +	 * If the write position is beyond EOF, zero the stale tail of the=0D
>> +	 * old-EOF folio first.  generic_write_checks() has already resolved=0D
>> +	 * O_APPEND/RWF_APPEND and rejected invalid writes, so iocb->ki_pos=0D
>> +	 * is the final write position.=0D
>> +	 */=0D
>> +	if (iocb->ki_pos > i_size_read(inode))=0D
>> +		ubifs_zero_eof_hole(inode, iocb->ki_pos);=0D
>> +=0D
>> +	ret =3D generic_perform_write(iocb, from);=0D
>> +out:=0D
>> +	inode_unlock(inode);=0D
>> +	if (ret > 0)=0D
>> +		ret =3D generic_write_sync(iocb, ret);=0D
>> +	return ret;=0D
>>   }=0D
>>   =0D
>>   static bool ubifs_dirty_folio(struct address_space *mapping,=0D
>>=20=
