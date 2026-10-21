Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598960;
	b=2tUvP3GQNEN3Gq/Ry3pbyawOogqw9vOsDkhSOKEz12+2gvPRkctCIbBr1TrM1mfT4MxG
	 zaCg8XmZLt7BbSi/u+6v175GnzoziYQllJOfrXsedmEIwtLiURck4eAzGbUYGN2dp7KCG
	 0qc+Kt/CKlkGsQF4pJ0hsrtK1qmU7uRNppls5LrN+tPj2nOG/9LYpvnD4e5hA86yf7ny4
	 U68qx6ANaOh54MzjjPyy0bjLASqR/bNDaKX8ZmtIgrn29gjm7tzy25X3f7Ouwh+X7dUqI
	 pXVdqywDXH3pMd+7qadSs38rngxsfPV/S9E1Fl9EfKMKL0nfk+nKIofly8iSlzAx+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XdA/1dgOR2+vUOT5wPwWboExQPZSnnOzRA32hGxvLSo=;
	b=wMQEjtYrQ96ND35NTa1Oo2O3ntv26l/TtVNGrfBYw9bIRCr0nym8fPhrN+QEIhL7e2Wn
	 nkVRzwaZTpbkNOAsr7mqwhXr2WLSw1yv3OazFBbJgYlWG/pR48DL0l+5U/b5me9+fwRZj
	 nmnaXZxjwvkCqfPd6zxu5L58x7Et7NqscW3gJB5fLBIMqXSwPNYTlsCqT+JdOcBcIOPp4
	 jeHxBal6kcbYq3Mgr1kbqMPoj3vI2hvHV4Z8XK3rLIBfGeKa3et2BOSl6cEVKdWruMwE1
	 Mghll7TST8oPS2ww+Y7qiKNm+Oqshnn5Yf1zowgK2JcaN9Dzy5qbtGxYlktJhqQPuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QrY4nIhv;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B46606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 16:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B46606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QrY4nIhv
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499dd4900dfso1447835e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792598958; x=1793203758; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdA/1dgOR2+vUOT5wPwWboExQPZSnnOzRA32hGxvLSo=;
        b=QrY4nIhvw+f5xPDDGYZqVHwiE/T7mXuzsXZM1DF+0mg+2KFBe0mq3jM2z1AaYmFyPN
         IU/ETfenNDJSfKE1iAx9nh6v+gYUnd8z/go61wSWbu9YvQV7RqOoqRPyAzusQ+mD7Nxo
         oq+gsQPFy5AVFTvCdBitLKeR1pcP98+fwMo0vSCueyv3G6rlhKHtOCzMN5R+FqeWIQsC
         /fNiVdw9MX7W45FL/1H9FRNcwP123ZeD5T8JneRkPIXEc9JrSjKTBLymDQQ+VQpppW9Y
         BPGhFK5qHmRtdiOspmNr9d7uFpiNRrA1zmERxqZ2GPmzm6rHiEGKINwpYvbXHW0sPaRD
         aJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598958; x=1793203758;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdA/1dgOR2+vUOT5wPwWboExQPZSnnOzRA32hGxvLSo=;
        b=qZ3jbEPNJiOn8PMgrte3pYwuCF9CPgT0yMviNe8+t5rTUzGuh4TbbuZRBxkNZ3iQ7O
         okyYWhWTwK3Kj9t9LlpG3NX8gBh5HL4T7fzo4LI5CHeiChzURoZb5imbJ4j7QrZe4ZAj
         s6YS3xbSVzRQTyjeYfPOiLsetYKT/PSXyPHddRMv5bYko5YxuH52UvAAsJx69DmNQyUd
         C1wo+3tHe1pbS2ceSXa4Q8/ukFlmdT4d27qIq3aMsBqaDGwTlrhlAfC9zxdIcJVe3w7N
         jeFWn6spUXvJGPPnPJU9mMjC2f25LQyIAcXspL3MwoVLDw0nefdbLAY6GjA+2TiBfHsH
         nhdQ==
X-Gm-Message-State: AFq9FYJBqhTWlBUT7anGyD3qE0bP/oN0pZw+Hwqppyl/laXjwyLMVjce
	2v6nsJpzNOR0cGQXBk1Wz17uI3tWp8eHmI/Dgcj54dFn2C5nZms2kwRCxj9Z/ea+CIL9r9OSxjb
	4gTvbBSY=
X-Gm-Gg: AYBFou3aWejuTP9p5SrJnf+BoAimyh0Xi+/jR+vQCd8cjnoTD2/vwB89HYXAqHHjl83
	BkGTPrVV0SLiBHcmERyun4TNNyEd0a/YqcZpjZ6U/5kdbwRnVpw15rmQYSd5EFbvhILqHXsgj6O
	SqH1iqOn3t/q7H+HjEkkzIN1hEHrAJhbuPSUMopG1OvakrQ0ReGmuEFbh+jVAIkOectbbYRQB9Y
	z0R5Uj7YkTC0ob6v0+AeMmDOJvyBK7HsnIskSQGeIymsbEXeVL9580EGy2WoznGWlhwq1Swhe5N
	OaWlXIukTo5ZvTH6gqQ4LDco8hXLUceskOj6/Vy/3HHN11Pr3I8VfvKNFyjZfzigztT5ODhHc35
	LbjVMf/A7ApFSv9nLTFe+4l1o65C/vyTq+5yz5wAMNraH2kJwGYY7U4eVgOuaKthDbeIvx2X0r6
	kVxfpgHTxJ4QlgK9etw5BqfQU5iO6EIsLGfZXfxmw2+mPwSu8s2xw/e+OcDZqYh8PVPyr8bSwI/
	3PTZqNZfxM/fVSlmLw1OsFKV6HsSMj+TGvHlTlkZzPnSKKa/n50P1SUcqU1/Q==
X-Received: by 2002:a05:600c:1c25:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4a1fdafd0d0mr57784905e9.1.1792598957526;
        Wed, 21 Oct 2026 09:09:17 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b410626sm13405705ad.20.2026.10.21.09.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:09:16 -0700 (PDT)
Message-ID: <ca6bcf4a-2f3e-497e-8229-cd213038931c@suse.com>
Date: Thu, 22 Oct 2026 00:09:11 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/4] ocfs2: switch DIO read path from buffer_head
 to iomap
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261018143319.22329-1-heming.zhao@suse.com>
 <20261018143319.22329-3-heming.zhao@suse.com>
 <sashiko-outbox-176228@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-176228@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 23:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] ocfs2: ocfs2_iomap_begin() caps logical blocks at 32 bits and overflows int
> - [Medium] ocfs2: ocfs2_file_read_iter() treats DIO EOF return as buffered fallback
> --
> 
> commit 0ce3e0976541f87f07073b3eedf67a03235e8f09
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: switch DIO read path from buffer_head to iomap
> 
> This commit migrates the ocfs2 direct I/O read path from buffer_head to the
> iomap framework, introducing ocfs2_iomap_begin() and handling cluster rw_lock
> unlocking through iomap_dio_ops and __iomap_dio_rw().
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 3215e2dda2be0..633d23dbbe098 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <linux/fs.h>
>> +#include <linux/iomap.h>
>>   #include <linux/slab.h>
>>   #include <linux/highmem.h>
>>   #include <linux/pagemap.h>
>> @@ -2545,6 +2546,116 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>>   				    ocfs2_dio_end_io, 0);
>>   }
>>   
>> +static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
>> +{
>> +	int ret;
>> +	struct ocfs2_map_block map;
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	u8 blkbits = inode->i_blkbits;
>> +
>> +	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Calculate the first and last logical blocks respectively.
>> +	 */
>> +	map.lblk = offset >> blkbits;
>> +	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
>> +			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
>> +	map.flags = 0;
>> +
>> +	if (flags & IOMAP_WRITE) {
>> +		return -EOPNOTSUPP;
>> +	} else {
>> +		down_read(&oi->ip_alloc_sem);
>> +		ret = ocfs2_map_blocks(inode, &map, 0);
>> +		up_read(&oi->ip_alloc_sem);
>> +	}
>> +
>> +	if (ret < 0)
>> +		return ret;
> 
> [Severity: High]
> Can this cap on OCFS2_MAX_LOGICAL_BLOCK (0xFFFFFFFE) reject valid large-file
> offsets and overflow the signed int return value of ocfs2_map_blocks()?
> 
> In ocfs2, on-disk extent offsets (e_cpos) and inode cluster counts
> (ip_clusters) are 32-bit cluster numbers, while block offsets are 64-bit:
> 
> fs/ocfs2/super.c:ocfs2_max_file_offset() {
> 	unsigned int bytes = 1 << cbits;
> 	unsigned int trim = bytes;
> 	unsigned int bitshift = 32;
> 
> 	/*
> 	 * i_size and all block offsets in ocfs2 are always 64 bits
> 	 * wide. i_clusters is 32 bits, in cluster-sized units. So on
> 	 * 64 bit platforms, cluster size will be the limiting factor.
> 	 */
> 	...
> 	return (((unsigned long long)bytes) << bitshift) - trim;
> }
> 
> Whenever the cluster size is larger than the block size (cbits > bbits),
> valid logical block numbers exceed 0xFFFFFFFE (for example, offsets at or
> above 16 TiB with 4 KiB blocks and 8 KiB to 1 MiB clusters). With this check,
> O_DIRECT reads via ocfs2_file_read_iter() -> __iomap_dio_rw() ->
> iomap_iter() -> ocfs2_iomap_begin() fail with -EINVAL at offsets that
> previously worked and still work for buffered reads.

the max file size is 16TB(0x1000,0000,0000).
OCFS2_MAX_LOGICAL_BLOCK represents the block number, the max value is
0xFFFF,FFFF in theory.
I will change the value of OCFS2_MAX_LOGICAL_BLOCK from 0xFFFFFFFE to 0xFFFF,FFFF.

> 
> Additionally, ocfs2_map_blocks() returns u64 map->len as a signed 32-bit int:

This issue was mentioned in [1/4] patch review comments.
I will fix it in the next version.

> 
> fs/ocfs2/aops.c:ocfs2_map_blocks() {
> 	...
> bail:
> 	if (err < 0)
> 		return err;
> 	else
> 		return map->len;
> }
> 
> Because map.len can be up to 0xFFFFFFFF (and ocfs2_figure_hole_clusters()
> returns UINT_MAX - v_cluster for holes at EOF), a mapped or hole range of
> 0x80000000 blocks or more will truncate to a negative int return value in
> ret and cause ocfs2_iomap_begin() to fail with a bogus error code.
> 
> [ ... ]
> 
>> +static int ocfs2_iomap_dio_end_io(struct kiocb *iocb, ssize_t size, int error,
>> +				  int level)
>> +{
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +
>> +	/*
>> +	 * When iomap_dio_complete() calls us with size==0 and error==0, it
>> +	 * means the mapping bounced back to buffered I/O. In that case leave
>> +	 * the rw_lock ocfs2_file_{read,write}_iter() keeps it for the buffered
>> +	 * retry and releases it in its own cleanup path.
>> +	 */
>> +	if (size == 0 && error == 0)
>> +		return 0;
>> +
>> +	ocfs2_rw_unlock(inode, level);
>> +	return error;
>> +}
> 
> [ ... ]
> 
>> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
>> index 62f45a1b5ca1a..519d4fb213db3 100644
>> --- a/fs/ocfs2/file.c
>> +++ b/fs/ocfs2/file.c
> 
> [ ... ]
> 
>> @@ -2598,17 +2610,42 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
>>   	}
>>   	ocfs2_inode_unlock(inode, lock_level);
>>   
>> -	ret = generic_file_read_iter(iocb, to);
>> +	if (direct_io && ocfs2_should_use_dio(iocb, to, inode)) {
>> +		struct iomap_dio *dio;
>> +
>> +		dio = __iomap_dio_rw(iocb, to, &ocfs2_iomap_ops,
>> +				&ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
>> +		if (dio == NULL) {
>> +			/* No I/O issued; rw_lock still held. */
>> +			ret = 0;
>> +		} else if (IS_ERR(dio)) {
>> +			ret = PTR_ERR(dio);
>> +			if (ret == -EIOCBQUEUED)
>> +				rw_level = -1;
>> +		} else {
>> +			ret = iomap_dio_complete(dio);
>> +			if (ret != 0)
>> +				rw_level = -1;
>> +		}
>> +		/*
>> +		 * A 0 result means the mapping bounced us back to buffered I/O
>> +		 * (e.g. inline data); the rw_lock is still held. Clear
>> +		 * IOCB_DIRECT so generic_file_read_iter() takes the buffered
>> +		 * path rather than re-entering direct I/O.
>> +		 */
>> +		if (ret == 0) {
>> +			iocb->ki_flags &= ~IOCB_DIRECT;
>> +			ret = generic_file_read_iter(iocb, to);
>> +		}
> 
> [Severity: Medium]
> When an O_DIRECT read starts at or past EOF, won't this treat the 0 return as
> a buffered I/O fallback and call generic_file_read_iter() with IOCB_DIRECT
> cleared?
> 
> In __iomap_dio_rw(), a read at or past dio->i_size jumps to out_free_dio with
> ret == 0 and returns NULL:
> 
> fs/iomap/direct-io.c:__iomap_dio_rw() {
> 	...
> 	if (iov_iter_rw(iter) == READ) {
> 		if (iomi.pos >= dio->i_size)
> 			goto out_free_dio;
> 	...
> }
> 
> Here, dio == NULL sets ret = 0, and the if (ret == 0) block then clears
> IOCB_DIRECT and falls back to generic_file_read_iter() -> filemap_read(). If
> a concurrent writer extends i_size after __iomap_dio_rw() sampled
> dio->i_size, filemap_read() will perform a buffered read on the O_DIRECT
> descriptor, populating the page cache and bypassing DIO alignment checks.
> 
> Also, since ocfs2_should_use_dio() already filters out inline data before
> calling __iomap_dio_rw() and ocfs2_iomap_begin() never returns -ENOTBLK on
> reads, is there any case on the read path where __iomap_dio_rw() or
> iomap_dio_complete() actually bounces back to buffered I/O?


The buffer_head path has the same issue. I suggest addressing it in another
thread.

@joseph,
There is no action to clear IOCB_DIRECT in the buffer_head path, so I think
the code below can be written more simply.
from
+	if (ret == 0) {
+		iocb->ki_flags &= ~IOCB_DIRECT;
+		ret = generic_file_read_iter(iocb, to);
+	}

to:
+	if (ret == 0)
+		ret = filemap_read(iocb, to, 0);


Thanks,
Heming
> 
>> +	} else {
>> +		iocb->ki_flags &= ~IOCB_DIRECT;
>> +		ret = generic_file_read_iter(iocb, to);
>> +	}
> 
> [ ... ]
> 

