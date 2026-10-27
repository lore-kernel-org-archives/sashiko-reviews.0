Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.191.123.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082031;
	b=yIX2/whlY3Q0eGpVYyxfofbr4Nceu89LjWMlSiz2pRwmRx7gAsoNx5CeGlA2zcfSNKZV
	 EDp8ck5rFS5ZVJCF9zRujXtElcbL0RzaVE1okRtwsmuxpnQcEkiLYB0jIcJy7f5v3UfDK
	 uePre48NGzJkYIj+4X7X1y828RxqLcwnD4wRRsIreRZGeADZ0ObaroVVlG2MLbPCEQIOe
	 bHUhKQjYsFZPASkO4rqzZmz32gwUY5F/YllcSzkS/hLSpXVKKjk7DRwGWRjz+6gnUaDdx
	 aFFYLqqnPJVR9GOKCSOpYPCL5MyoqoHL03kh7t37d3t6I8Agkqj7CZYCZe124zmH93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082031;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=uN0V6ZopmcpaMb95ZBL6D4aCWabY63TYJz+uI1M86qc=;
	b=1kz7wYPVrlHOR/s6FmeMhBailRtmAAhr+vfSlGm9ZgX5JJySWSo9v6Bd8kxoGJpsUcqB
	 IGtUPDOS2Et8sWUBO5sdZ39PYFnKizTFy4h4Grj2UgAfT/206nwW3j5nBJ/QKAjGSvt6u
	 HT/o7lAFndIX8Pkc5L4NdKGkRQCGjBCBc9r/BtcDJwjtTvgDIXxydXq00Apycu6QLbMKc
	 Zg/fLflvUY327HLmvwbtUOOYGWG7QMF7JTF6BavNr1Yx1Wc92DxrQw+u10PTiNNgFjspC
	 Ona3HELcg5QJWZ312xr5j97U/EYZtjxqtqSKxG9A23K6a4qz7QKvf59e3fKc2kfI8tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=h3c.com;
	spf=pass smtp.mailfrom=h3c.com;
	arc=none smtp.remote-ip=60.191.123.56
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EC606A320
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 06:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69R6K1MB052305;
	Tue, 27 Oct 2026 14:20:01 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 4F8F12284EA5;
	Tue, 27 Oct 2026 14:23:22 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Tue, 27 Oct 2026 14:20:00 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <sashiko-bot@kernel.org>
CC: <chengzhihao1@huawei.com>, <lin.nan@h3c.com>,
        <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
        <zhou.kete@h3c.com>
Subject: [PATCH v4] ubifs: zero stale data beyond EOF before file size grows
Date: Tue, 27 Oct 2026 14:12:26 +0800
Message-ID: <20261027061226.3506517-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <sashiko-outbox-185311@kernel.org>
References: <sashiko-outbox-185311@kernel.org>
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
X-MAIL:h3cspam01-ex.h3c.com 69R6K1MB052305

>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c=0D
>> index e73c28b12f97f..6f2c83b6f4333 100644=0D
>> --- a/fs/ubifs/file.c=0D
>> +++ b/fs/ubifs/file.c=0D
>> @@ -202,6 +202,45 @@ static void release_existing_page_budget(struct ubi=
fs_info *c)=0D
>>  	ubifs_release_budget(c, &req);=0D
>>  }=0D
>>  =0D
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
>=0D
>[ ... ]=0D
>=0D
>> @@ -1433,11 +1476,46 @@ static int update_mctime(struct inode *inode)=0D
>>  =0D
>>  static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *fr=
om)=0D
>>  {=0D
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
>>  =0D
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
>=0D
>[Severity: High]=0D
>Can stale mmap data still be exposed when generic_perform_write() encounte=
rs a=0D
>short or zero-byte copy in copy_folio_from_iter_atomic()?=0D
>=0D
>Suppose a file has a non-page-aligned size old_size and a shared mmap writ=
es=0D
>beyond EOF, leaving the old-EOF folio uptodate with stale data in=0D
>[old_size, folio_size(folio)).=0D
>=0D
>When a subsequent write() or pwrite() starts at pos >=3D old_size within t=
hat=0D
>same folio, ubifs_write_iter() skips ubifs_zero_eof_hole() if pos =3D=3D o=
ld_size,=0D
>or only zeroes [old_size, pos) if pos > old_size, leaving [pos, folio_size=
(folio))=0D
>containing the stale mmap data under the assumption that the write will=0D
>overwrite [pos, pos + len).=0D
>=0D
>However, if copy_folio_from_iter_atomic() copies fewer than len bytes (for=
=0D
>example, copied =3D=3D 0 due to an unmapped user buffer returning -EFAULT,=
 or an=0D
>unfaulted user page when a signal is pending), ubifs_write_end() only take=
s=0D
>the short-copy bailout when !folio_test_uptodate(folio), and otherwise ext=
ends=0D
>i_size to end_pos =3D pos + len rather than pos + copied:=0D
>=0D
>fs/ubifs/file.c:ubifs_write_end() {=0D
>	loff_t end_pos =3D pos + len;=0D
>	int appending =3D !!(end_pos > inode->i_size);=0D
>	...=0D
>	if (unlikely(copied < len && !folio_test_uptodate(folio))) {=0D
>		...=0D
>		goto out;=0D
>	}=0D
>	...=0D
>	if (appending) {=0D
>		i_size_write(inode, end_pos);=0D
>		ui->ui_size =3D end_pos;=0D
>		...=0D
>	}=0D
>}=0D
>=0D
>Because the old-EOF folio is already uptodate, wouldn't ubifs_write_end()=
=0D
>advance inode->i_size and ui->ui_size to pos + len even when copied < len,=
=0D
>exposing the unzeroed stale mmap data in [pos + copied, pos + len)?=0D
>=0D
>By comparison, ext4_block_zero_eof() zeroes the entire tail of the old-EOF=
=0D
>folio from old_size to folio_size(folio), and ext4_write_end() only advanc=
es=0D
>i_size to pos + copied. Should ubifs_zero_eof_hole() also zero to the end =
of=0D
>the folio (or be called whenever the write extends past i_size), or should=
=0D
>ubifs_write_end() avoid extending i_size past pos + copied?=0D
=0D
Valid concern. I think the short-copy issue is best handled separately=0D
since it involves write_end() budget semantics and affects all buffered=0D
writes, not just extending ones. Note that the i_size advance to pos + len =
on=0D
short copies is pre-existing UBIFS behavior, not introduced by this patch. =
=0D
Worth a dedicated analysis/patch but outside the scope of this fix.=0D
