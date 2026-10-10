Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15C2877E8
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599628; cv=none; b=lCkTZbIjuCbG+hwVrLhf6pOvDSf8BfmJqkqLff3LMkB9wM3qQHfq7H0a940050scmsK2SfApozb3hO4EU3njbA0lRmEwcfU+pjkmG+etERCU+tRKvfzta173xJwO0ngPFzPAgXoRDKYoVBKfGxrsMMgXz51bIz8asrbHTUvRzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599628; c=relaxed/simple;
	bh=0wMBqclhma4cJaDymreec7xEshpKLFtABUes117fpWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tppvmlB+nGcWWirIj+JHU/dYU/j960Kt5xyFk48t0b7iiwJObrXy/GABCtjki5RTMcWkb8MzyDNLiHse4n5BFDA4uCuqtYNTryj0p3HgJvaQsqIHGJ9QzdmyHM7++uw8iMUTLK0x7PhPh25J2kPINERvyqZehjUTy1IGKF0GG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4hwYG2c; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4hwYG2c"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b3c37877so128082a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791599626; x=1792204426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBelTmompdM3mA4VVDTQCGY1mxSHgpB0e021EZ+22c4=;
        b=Y4hwYG2cqVcaotdsRVVMrxgkT41S8WGA3cJVaUo7AWRO0Kc+Hblb2YqY4TCm7nangK
         8BmMPf5L47RuJN58L4j1bNTJRfVd1Koqr15D94SJnA8ClIn62KTcMnERi1N60TSKalVQ
         KXo/ba5/RrR2pIggLeGhjKBOKIxL0sKJrh3Eg4iYryp2RrzE/mepn8Qi1DkVKiQ6B4N1
         yTzTIlu5I/+OMu+XCHowBc2XJUOTY+y2iHtV+ZIBQjEbOEgFUm+LGUJaaAKlqJEC1gCI
         r+BNLCOtcRdvB/ROa8sqmWDZo+8pctYmJoF6Mj/d5OaJfJnusM+MG0DygEe/V5FxJ0Nt
         NUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599626; x=1792204426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBelTmompdM3mA4VVDTQCGY1mxSHgpB0e021EZ+22c4=;
        b=V4Mz3D3DkGPejZnt2hZg9SU886/EzWdMWr1WmxZzo0u7z1G2x34iQVI3yr4k/8rvQl
         e31pKU/wYXqW7nel2/+BcopaOVOYTp4vn1XKBYx8yybxNG+NdsAkQG8hWVdc4Jh52WPr
         K4WI3EIebW2gjjkNCbTTrIvdAzx80yIMgo5Dh7TJYR7Yhig6r7xiZorWTD0tnRN9kgEw
         ObOm4tS8nrWhTpfecr59tYIKTevKEQzRnA/VsacHbjH4ffsG2TQUyWz1y9D/2N1MtTmp
         qTu5PHqLPMpGExloItzoLJhmDs5Hsjjjkg1vE5VsHfwW7HUALDcwaEBSfzxXEhVHE2e7
         zJ9w==
X-Gm-Message-State: AFq9FYLQKyNks1nrQNPF++64uhWx8OgBm5FZsQqOXuXwnilTwuDkLYg/
	qWhazuS6VYvqF9vuPxknz6IybIGeFM6U6gZwNT4bT/sZIcda053qU8zVDMfgpG/9iEU=
X-Gm-Gg: AYBFou0ApHntQTXCzxZgpB2XuT9mMrbNgSWRfRksyarnOc4V13Fu0tSPfkrCvw0DUsf
	Z4XVQDtgH6k3p1zj9L6GSaao0vFbIKBDQ3w2HGFTITMJBb1hgpS/o9vAYVrUDJ+60KMyUieooz0
	3Co+NAasYAPz46zS51z+yHfSNEA+nQDzb2O9anMN/akxLGra4PxjtTJRlCbk5tafhun99QGmZnG
	wuaCLeelkAlH4M6b/OMh90ZZJ/uFFzb2guaT1rFa1X/+oYRRifMfKK3rQJ/2io1+joME3b8uEtC
	69QBAl9HQsqn6sy4XbyLMqcj6q7G5YqR7ksKAuApbY6cIb5fqSUZ2t5wuYo089gkE2AABSIHNL3
	zXk4S/npBLX4/qo6+OsgBNpVyZh+iTACPupxWM1ZOsQPbolsR++Fw4Wpz/L35w5O4OWjRxRSSZ5
	Glbr/J7x1/+SQCvKpG1bsg2H4rBR5f12W3QEAHTK4Ksbvf7X4CY7YiNecQnLC5Dnmzdkx55MamG
	4Tn0VUmLAjOQR13WIld
X-Received: by 2002:a17:90b:3d89:b0:3ab:c6d:2bf9 with SMTP id 98e67ed59e1d1-3ab3afdaaacmr3655096a91.57.1791599626493;
        Fri, 09 Oct 2026 19:33:46 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm6165781a91.12.2026.10.09.19.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 19:33:46 -0700 (PDT)
Message-ID: <b82ca2bb-1026-440d-871f-d092e57a17e5@gmail.com>
Date: Sat, 10 Oct 2026 10:33:40 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/31] ext4: rework handle credit accounting for
 unwritten extent conversion
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-15-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165354@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165354@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4: atomicity violation in fallocate extent conversion
> --
> 
> commit 352cf8eb3125c707efc06205d4a61cc670cd67bf
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: rework handle credit accounting for unwritten extent conversion
> 
> This commit updates the unwritten extent conversion process to handle long
> merged ioends. It introduces a check using ext4_journal_ensure_credits to
> extend or restart the transaction if credits run low during the loop.
> 
>> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
>> index 76038b6c36552..83d040e36b682 100644
>> --- a/fs/ext4/extents.c
>> +++ b/fs/ext4/extents.c
> [ ... ]
>> @@ -5137,27 +5137,36 @@ int ext4_convert_unwritten_extents(handle_t *handle, struct inode *inode,
> [ ... ]
>>   	while (max_blocks) {
>> -		if (credits) {
>> -			handle = ext4_journal_start(inode, EXT4_HT_MAP_BLOCKS,
>> -						    credits);
>> -			if (IS_ERR(handle)) {
>> -				ret = PTR_ERR(handle);
>> -				break;
>> -			}
>> -		}
>> +		/*
>> +		 * The caller cannot know how many extents the range covers,
>> +		 * so make sure the transaction can take one more extent,
>> +		 * extending or restarting it once it is full.  The reserved
>> +		 * handle of the buffer_head writeback path is safe as it has
>> +		 * enough credits for the conversion, so it is not restarted
>> +		 * here.
>> +		 */
>> +		ret = ext4_journal_ensure_credits(handle, credits, 0);
>> +		if (ret < 0)
>> +			break;
> 
> [Severity: High]
> Does restarting the caller's transaction here break atomicity requirements
> for fallocate?
> 
> ext4_alloc_file_blocks relies on the atomicity of converting unwritten
> extents to written and adding the inode to the orphan list. This prevents
> e2fsck from flagging initialized extents beyond i_disksize as corruption on
> crash.
> 
> If the transaction restarts during this conversion loop, the first batch of
> converted extents is committed to the journal before the loop finishes and
> ext4_orphan_add is called in the parent function:
> 
> fs/ext4/extents.c:ext4_alloc_file_blocks() {
>      ...
>      ret = ext4_convert_unwritten_extents(handle, inode, ...);
>      ...
>      if (new_size && converted) {
>          ret2 = ext4_orphan_add(handle, inode);
>      ...
> }
> 
> If a crash occurs after the transaction restarts but before ext4_orphan_add
> completes, will it leave the disk with initialized extents beyond i_disksize
> and no orphan list entry, triggering filesystem corruption warnings and
> silent truncations in e2fsck?
> 

This is a pre-existing issue in ext4_alloc_file_blocks(), which is
extremely hard to trigger in practice, and the failure mode after the
patch will differ somewhat from before.

This can only be triggered by a size-extending FALLOC_FL_WRITE_ZEROES
that runs concurrently with another I/O completion. Since
ext4_alloc_file_blocks() holds i_rwsem, what it requires is that the
extent that the ext4_map_blocks() call at the top of the loop returned
as a single extent gets split before ext4_convert_unwritten_extents()
is called, so that the conversion is spread over more extents than the
extent tree had at map time. That means another unwritten extent
conversion has to land in that window, and the io_end conversion runs
from a workqueue, so it routinely completes only after the data
writeback and after the page cache has been dropped. A direct I/O
completion (ext4_dio_write_end_io()) can do the same. Buffered writes,
truncate and other fallocate calls are excluded by i_rwsem.

Before the patch, in the worst case, this would exhaust the handle
credits and cause a filesystem error. After the patch, since
ext4_journal_ensure_credits() will first try to extend the credits, the
credit exhaustion itself becomes much less likely, and only when the
extension fails, because the transaction is already at
j_max_transaction_buffers, will the transaction be restarted, which then
can trigger the issue Sashiko described.

This issue needs to be fixed separately, perhaps by moving
ext4_orphan_add() in ext4_alloc_file_blocks() before
ext4_convert_unwritten_extents().

Thanks,
Yi.


