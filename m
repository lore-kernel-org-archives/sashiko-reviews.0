Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F702331A48
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619749; cv=none; b=EKJt7p+qfdsM8+7qRGfjjs+GVCB2k35ylxKv3NA4Dm9NbKH/4eBk2IHxRMCbs1EFV8M5DKc08z49JOviHQUDZuO3KOnrDiJ7lcSIBEfbWFtrOtWfL8SGZ53vC4ta/5O4kou3wi1RjqEghGBdAEJ0HrT+Wa1hez1mOsToxaiqLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619749; c=relaxed/simple;
	bh=VyXzyhxXix2J5dcURdpKFUag11U6FjtFgNekV8QQaic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPSIdFDTbZfJIEyeuav4khxBZJKhKWPNQT9Dos4bt+e6VvdQ1KdBSwlEz+zn3Dbkz564M+7eNMoS6VhcGhfwjq4BbSnvHR9gu0Gsa7FbUbvIsTP/qke5YnOaUpsB9eI+iPKdlPqvvFUOnlWyZcxFItuW4BHHtdMpBEMd09+TgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtayW+ds; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtayW+ds"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so132991a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 01:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791619747; x=1792224547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPdE1haLXtYmkfSNpDltFBKmBYf3c6eC0Va7uh1cwWE=;
        b=DtayW+dsL7/xXIpFGfJ7g+lPpQoV+qfo1zNFaArwaxerXdBg+ACoqnP/tq8jVTxCv4
         4mf0y8KPrTydMXaAXWXby96K8SA6+q2c7KiAoAffgoRUg43Vgv1tlOCF8JRemlzV+Vrf
         eWNsMRWL+BJcaqMwRzRdckhVyq1TLOMod3s+Ht7QIs3fAwByrAp+bI93XM5nOYQFxsu8
         vlGll7yUkJ2qOsb8epbbhVn2C+0muvRAzCDBwiP18WawZbCFsqA205CKBYQYDoVum5eP
         sR1gWsJv5T6p4DcJKxMGnj5ucWr7K4wiwJqclPRbnLqJr1RYapH9skKq+BPDMge+TqWv
         3w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619747; x=1792224547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPdE1haLXtYmkfSNpDltFBKmBYf3c6eC0Va7uh1cwWE=;
        b=TrBlRARK337eGEhzhRUxy3RCFQ3F/ME2FoFjKg4XD79vJ9jmqT9RYtdyUYYKDyuJqu
         CCi8rTO3riPpDsefKIDGSc1oWbKpimqM++XVUawmla5T5ElAIVwDdF7Lmph8gFWVIrK8
         q/D31ep96DJ67b5grtkBz2zpbWprF6XFbTSPZuY4ZhMvPm35SA+QCOk9AD0IaVl9i7f5
         6U3uNeaXkh2qHZz4eHoBzxhG7iNHjCq8w1FMf+eTGowJuVgOdSC4CyfDazgSmJgfdec5
         au4IwB1sfJOsoiveb+QlC8KOQGYILieK/q4WseVjm26gRBB6c6aFrZ4zk217pjM1lmpi
         ZN4w==
X-Gm-Message-State: AFq9FYJQJ9GixU1UFYOlDI0SfbsKbXRJtkOaKteLDCypEskib+JQ6Uia
	abSK9CRI27DYSAvAk8z9IncOE/j/bmz/B/vZ/gX+fPx9GW/whgs74AVECGgiZOC5354=
X-Gm-Gg: AYBFou0MV8PwMKsbWrxMfp6dwViSDjmGbMGf5fZK01d0wxfVJlgJpK3UoB264DYo0rB
	wsJbc43oKd7bB5b3ZmspaNkOA/eyIZJjd8G620hNwW+e5rZAqE8zgMpz7eMFrlVYylPPN11mz/V
	4tdEonkeIs0AZxAFUs3sfz1Zt34/1kOEYTok9TAB9EYgfzDEQPA2NJ5QgUa21n9UjWACJVJTlzf
	QE+5AjRHgFzZeShtRtbkhx4GFUxK7yMeg6smJ+VY6FRo9EamIHMEM7NqmYUjTfMbav23FFRvV+B
	QofBKTqv1qhPnTVk5iBqpAW3WOKzMrv1VmCc3/X9kjeHojwL9m5M+BkJ3q89Ys371HUmmnUNwRi
	oFpzGWBv8I4t5F4FJVLkJnZc9dyBprSTrA5kFPSQddPO4BNyn2RXLyGxIiEXtdBi1spYN1K0V7J
	V3AGEaWezUU+uA1wYyLVdTmMlDgIvc6lHtDZjPDrhIV8Osw3NNqNj7z+2FAiXXcjrHDxVCR8G0L
	5kDID4uzibOawFwH/s=
X-Received: by 2002:a17:90b:510a:b0:3a8:e2c:af52 with SMTP id 98e67ed59e1d1-3ab3a93eae8mr3361522a91.24.1791619746698;
        Sat, 10 Oct 2026 01:09:06 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm6887768a91.16.2026.10.10.01.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 01:09:06 -0700 (PDT)
Message-ID: <fe737cea-e80b-401e-b03e-d2eacf7b7fb3@gmail.com>
Date: Sat, 10 Oct 2026 16:09:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 30/31] ext4: partially enable iomap for the buffered
 I/O path of regular files
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103831.2978767-2-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165384@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165384@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] ext4: NULL pointer dereference in pagecache_write() during dynamic fsverity enablement
> --
> 
> commit 3391a6fc6c975d43c433b32dd18bae4da4784860
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: partially enable iomap for the buffered I/O path of regular files
>      
> Introduce ext4_enable_buffered_iomap() to determine whether a regular file
> inode should use the iomap buffered I/O path. If unsupported features like
> fsverity are enabled at the superblock level, the inode silently falls back
> to the buffer_head path.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index c3a6f3dce3d86..a07ce368e6e82 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -6076,6 +6098,81 @@ static int check_igot_inode(struct inode *inode, ext4_iget_flags flags,
> [ ... ]
>> +void ext4_enable_buffered_iomap(struct inode *inode)
>> +{
>> +	struct super_block *sb = inode->i_sb;
>> +
>> +	if (!S_ISREG(inode->i_mode))
>> +		return;
>> +	if (ext4_test_inode_flag(inode, EXT4_INODE_EA_INODE))
>> +		return;
>> +
>> +	/* Unsupported Features */
>> +	if (ext4_has_feature_inline_data(sb))
>> +		return;
>> +	if (ext4_has_feature_verity(sb))
>> +		return;
> 
> [Severity: Critical]
> Does this logic handle dynamic fsverity enablement correctly?
> 
> If FS_IOC_ENABLE_VERITY is executed on a file where the verity feature was not
> initially set on the superblock, ext4_has_feature_verity(sb) will be false at
> inode initialization. This causes the inode to be assigned to the iomap
> buffered I/O path, setting mapping->a_ops = &ext4_iomap_aops.
> 
> When the user executes the ioctl, ext4_begin_enable_verity() does not check if
> the inode is using the iomap path. It proceeds to write the verity descriptor
> via ext4_write_verity_descriptor(), which calls pagecache_write().
> 
> fs/ext4/verity.c:pagecache_write() {
>      ...
>      res = aops->write_begin(NULL, mapping, pos, n, &folio, &fsdata);
>      ...
> }
> 
> Because pagecache_write() unconditionally dereferences aops->write_begin, and
> ext4_iomap_aops does not implement write_begin (it is NULL), can this lead to
> an immediate NULL pointer dereference?
> 
> Since this can be triggered by unprivileged users with write access via an
> ioctl, could this be exploited as a local Denial of Service?
> 

This is a false positive.  An inode is put on the buffered iomap path
only when the superblock does not have the verity feature, and that
feature is not allowed to be enabled at runtime.  It is a ro_compat
feature set by mkfs/tune2fs with the filesystem unmounted, and there is
no in-kernel setter for it.

More importantly, the only way to reach pagecache_write() from
ext4_begin_enable_verity() is FS_IOC_ENABLE_VERITY, and ext4's ioctl
handler gates it on the same ext4_has_feature_verity() check, so the
ioctl is rejected before ext4_begin_enable_verity() is ever called and
aops->write_begin() is never dereferenced.

Thanks,
Yi.
