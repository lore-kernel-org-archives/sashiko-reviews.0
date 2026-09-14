Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6440EB9C
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375160; cv=none; b=FUdpolTATZv8m33Bbggl+RIWLacPinxL8cIC2qqZbPKzShsja+ybzl5VNOrrFivtVpYrmh1OTDvqb1mXx8BzekrTcFCHhjipCD4wnlVIs8qnGv0jF8qLDlifPBiruAZyqKtZY4RdfHd9uJXSo8xK+DR5MCkJUUcEGG4f8kEa85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375160; c=relaxed/simple;
	bh=T/NQlj4KEFbvcTcKeRCSLdv1JT6NuTOoCJ9yjBSuhIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPc2hd/B132Te+0346JtLYK9p2qRfsikO6jleJ7xwVIBnvjO/XIMnY5wCLyR8v0SCHtrqE/6l9voZZnmPjGs+9G4DCasjsyeUF6SjxQTGkxHT+RdH+c9nrJGKa0aGzDPKscpOu7jybKdix/Lyiq5I7T2yWSfpnVA6RnFIrnqJmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPKsmHkV; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPKsmHkV"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso948883b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 01:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789375157; x=1789979957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGBrkoHMIJFGZ2LVPMmbnKr8Js6OWQm/jH/GzpXmdy4=;
        b=SPKsmHkVv40wkFzbsiXHD0T+MZhYqE1xQKRQp/uVcFW3v2kJ3/sdGsZv9eDrI/i7Gm
         4j19JA0+1/+iot2dY48Cu2NjL08XDkv02a9iYpKtJEa2HhdTHF/bc4a+a166u8Otluvn
         HMLiHIGEvvYdX7as68WtyxX0VwtIBg5KtzZGZOxVPzOvCm7vyK82Ur2cSiFSkHQs834B
         X14aYZDNKrL6qQrs/QH2WWAq/ylQS86NGIbkOlTIj4qS44PsJw6bttHSmcVL9RKJllw8
         TOhOQN2ngP/r9GJxbKNgCOXfeOdypsrNI/PQ2GsqZkwMe5GQl7Ic8BG/foDX+0lQk5JL
         XnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375157; x=1789979957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGBrkoHMIJFGZ2LVPMmbnKr8Js6OWQm/jH/GzpXmdy4=;
        b=pdE2t6YibI+YH60b6svhOwFDTiVKjeFRf7NFM28OEpJ5i21nNvBp6Fckb0t1idCUJh
         bOdnYsLn/YpjfNVI3XkEMphGOI/nhArdXFXue9ICJ/CIm6N4HY+IpkPxtpXi89/KD7f3
         hzdKMP8KaNCa8LDKJQLhCxCvoeFf6kP33XIOvFUp7DxhLFPVuqJmsNFKPR2mwqupEYfX
         JLMyT4ZzU/leodyU0A8H6uVtDw8rQyYuoGsWo0vpmVxCnbmfY2sm8Uown3GSkYt5FmQa
         n+mxzzWKhKB8wkoXlNe77AbZeGCekNqNEiSCCnRiR8va+0Ot4njxW8Un0kLAi2Em/LYx
         2JqA==
X-Gm-Message-State: AFuF++mVuvyIlz6UIMuomYMqeF5V5X8P35s8lEMdlBjJ5usDPUnlztj1
	+jdHCTV2ukOZIJ4p2BCHI3BBP071SGJLldFcjDYHWa5h2An5wKqV0CjnwpBvvPmnEFE=
X-Gm-Gg: AYBFou3YoMTd7o844w3vibrwVgsdcn0WTa0BwNnBk1QR0UdeJLRDsYmmxXwF9YiMyfx
	sMxEXTzvCucsnDb1Cx2lyrGzU9NS/fxUSH27lcK5JsrxHbCfkDH/0rG99pCWd6KKzs5IwVvZgEA
	TPn2yC+ImkRQdVUSDKvyvfgHmVJ+T1yZwFZuNRG09ibzmgp4xwSF71/wVyhA3tWl+GVOu4cz9dK
	QTfcjaDC+BuvOHVrljlFH3Jrl6aLyu6BSWkvBBamjSjXiHAfiQjYI/K4RgHwEJhXfvOlQrpWOWP
	83ANZ0hP4Sw4wDPD84HGN9bY1sWoxMtwRJcR3ueigBZMvBoTnLyI6vdZpwmeKBjWlpnxk0jFPUK
	uxBORImx0n5pj8ia6OnhCv8HActZsbaq456dyMmGGYCJry6tnHAlgA+RhEdPMKCvUSXPtONtoxL
	ZrljH8vB56DOwfXL3hhlz/uYnPbBchBETk61aDoa5eGLjQ7ifsiP4tQmMNt4wfYwPjW/sI5dNfb
	oNCOcLehVt9uwWUnpM=
X-Received: by 2002:a05:6a00:950b:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-86f82a5f333mr3496436b3a.3.1789375157194;
        Mon, 14 Sep 2026 01:39:17 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29bb8f28sm4294932b3a.40.2026.09.14.01.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:39:16 -0700 (PDT)
Message-ID: <3b84eec4-82c3-409b-a5bc-5a68a8aaa9b8@gmail.com>
Date: Mon, 14 Sep 2026 16:38:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/31] ext4: partially enable iomap for the buffered
 I/O path of regular files
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903124017.2325538-2-yi.zhang@huaweicloud.com>
 <20260903140457.8A92D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260903140457.8A92D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2026 10:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Concurrent buffered reads during dynamic transition of the journal data flag cause type confusion on folio->private, leading to memory corruption.
> --

This is a false positive. Buffered reads do take invalidate_lock.
filemap_create_folio() and filemap_update_page() acquire
filemap_invalidate_lock_shared() before installing the folio and calling
->read_folio(). Readahead and page faults do the same.

Thanks,
Yi.

> 
> commit a5650f621dac34bfe427e11f706ab1c16d533afc
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: partially enable iomap for the buffered I/O path of regular files
> 
> This commit introduces ext4_enable_buffered_iomap() to determine whether a
> regular file inode should use the iomap buffered I/O path. It also modifies
> ext4_change_inode_journal_flag() to dynamically toggle the buffered I/O
> path and address_space operations on an active inode when the per-inode
> data journal flag is changed.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -7598,9 +7695,10 @@ int ext4_change_inode_journal_flag(struct inode *inode, int val)
>>   	 * the inode's in-core data-journaling state flag now.
>>   	 */
>>   
>> -	if (val)
>> +	if (val) {
>>   		ext4_set_inode_flag(inode, EXT4_INODE_JOURNAL_DATA);
>> -	else {
>> +		ext4_disable_buffered_iomap(inode);
>> +	} else {
>>   		err = jbd2_journal_flush(journal, 0);
>>   		if (err < 0) {
>>   			jbd2_journal_unlock_updates(journal);
>> @@ -7609,6 +7707,7 @@ int ext4_change_inode_journal_flag(struct inode *inode, int val)
>>   			return err;
>>   		}
>>   		ext4_clear_inode_flag(inode, EXT4_INODE_JOURNAL_DATA);
>> +		ext4_enable_buffered_iomap(inode);
>>   	}
>>   	ext4_set_aops(inode);
> 
> [Severity: High]
> Can this lead to memory corruption due to a type confusion on folio->private?
> 
> When toggling the journal data flag on an active file,
> ext4_change_inode_journal_flag() truncates the page cache, but then blocks
> on jbd2_journal_lock_updates(journal).
> 
> During this blocking window, a concurrent thread could perform a buffered
> read on the same file. Because ext4_file_read_iter() calls
> generic_file_read_iter(), which handles buffered reads without acquiring
> the inode lock or invalidate_lock, the concurrent read can instantiate new
> folios into the page cache using the old address space operations (for
> example, attaching a buffer_head structure to folio->private).
> 
> When jbd2_journal_lock_updates() returns, this thread will proceed to
> switch the operations via ext4_set_aops(inode).
> 
> Will subsequent operations on those concurrently populated folios invoke the
> new iomap operations, misinterpreting the buffer_head pointer in
> folio->private as an iomap_folio_state pointer?
> 

