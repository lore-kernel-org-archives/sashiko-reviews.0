Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AADF352C3C
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053717; cv=none; b=qMgbf75CZxJcwKyVstm9XDS1G7CCFK3GM3g1nFkuhFz+s3PnJdczYgmz8MrLPex+askfLOMC5am5SeuaQrGYlcbuFvdPmrcMdE9WPqBouFwhHfnsx5hcGswzNn8NlCev/lDOBSn7ctWRZbF9ofqOCYOozDdi7y2fc3fVX7Xa+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053717; c=relaxed/simple;
	bh=f4M03IgTGvJzs6Io2GQZAJIVHwGhSeIiCc9sVfHn/Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJ9QorKK5aFZ1hWkpfu1bDYrrYIw/4Pb5v3ZDHvGpd9bazHtudWf5i6lD0eAJVc347SsPYl57W61pvPeeWESR0e42WB8tLZYHn/w6j0OSs+CQoQjmkXv65huKO30YJMC3Ls85SL/eFT+KwGYNftZ8r59brq1yBWSwJg2k741Cdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4Xz9f4o; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4Xz9f4o"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c999f162c9aso3045218a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 04:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053716; x=1787658516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MInesFRTHKDvaq1Aqhz6QHAocvKV6d1p+jvF87TFwgg=;
        b=e4Xz9f4oCBdLOERrGw4uc/BFZmBnHqSIoNTfhj/y0LEzq9msokY26xqeAMO7L1bk2i
         c3gno35q0fVY82Eet2HT/58WxcwPZaU6fU+ednFphigwHUci4mgp267utyUs0TG8v/Qa
         P7v2cxbSmHVQ7+sQxcSdf5yuCkKvdVoHq/TsZpp1iX3uocdhmryONQxwEssndNEA2eWs
         +oMa3CxY+m6hKw77U30Tvt2fnCUVuQbnp6thcItRDhuQO28Bh30ys+mpBK76rafIIw5U
         ulw/zt5pEXqhxpzX7D5tdozq2aSkx6A0VJcl3ydWlNdonHN6NwymSmGafcaWiIUMy87b
         m+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053716; x=1787658516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MInesFRTHKDvaq1Aqhz6QHAocvKV6d1p+jvF87TFwgg=;
        b=Zao+lvOJZ2WxvbSPIcF43jKBKd0OnOD3mhbfhAFBm8Yo3muwb8Bph+tgJp3t8eklFD
         x2uat1+CFoM3ZVOXazaApMeO7Is+GQw0KkytXEnVTCMwEOMwgdEs5HmEF1f5ajhtExGi
         n8Dg/enCgKBHThgHmcM6I+4zvpz3XNAaMx7plHP9lqX2wN/hIQYbj5ffqdZJrGre3vZy
         WffhJp18Ff8dyIxRnODLWle9GhKLpPNyhOBEdWLF0ZmSduht7AIdYDKq4vyiKiI56CCF
         o4Rxu1wSG6xT9Gx++gLg9El1Yr78F+wxycQfM8HuIKyS1OtzV3Dk0iofQZGItVRxjd+Y
         +neg==
X-Gm-Message-State: AOJu0YyeIq+hyDYLNR1A6sS1esvtw5Bas3sYvP7ZyLIjKV6o1cuUJXam
	zffUgxJmDGYAF1w30GGg2z5XFzzG1ALJqeBnrzMJVTKEv0l1W6Ulqj3g5n2iltIyyLg=
X-Gm-Gg: AR+sD12HL3t6uLoHcIuorh2IcNLI+Fuc1/dEDmMB8ooGKBep4Ms1F65SEHhlWbhw6+L
	sV0S+/Y+Vqdg4hf0tUA7cPqPkdPSXi0Itjp1aRd/B6iQBzFRn5ftlwIcbwHPhpeFrEHQjtxMWry
	HF48q549Y3cLury/l6Ly062APeD27TiA3e3zVLI9ECrWIWpoiPekN+8rYS3TLMZBMsPA3mzP3Y1
	bYBEkcCxL7kCBlcSCzD271S9iQAjrKx7qQ/Yhc/ZWmJ+fkLqcp2W/Bh/q5E3CadZc+q/CI5UR16
	wkdoNxpTDs9hxaMQOI5M2AOntk9EpXg+wEBDBjuKgAH9BnrZhia6plr8A9YWF7BGkslXLFhY+/A
	3u3mfyN2xQV5GVOIdDBZGvZbxxwGhbK5AFLKy09li3gTquAxQ1MvaSJpKBoQ4VNrdjFsDo+1wS2
	/NyyY6oUkMqFn9PCQRNFiYpjrhnOSYW2+TDEfXZwCiAq6UT1WIGlZTxwe2G2G4QRzx+vI+YIsKl
	6ashP2f
X-Received: by 2002:a05:6a21:7d0c:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3ccdaa0da04mr11555031637.16.1787053715788;
        Tue, 18 Aug 2026 04:48:35 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc142c4af3csm1026035a12.0.2026.08.18.04.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:48:35 -0700 (PDT)
Message-ID: <fa08be09-fa95-4b55-a13d-1ec5886b010d@gmail.com>
Date: Tue, 18 Aug 2026 19:47:58 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 24/32] ext4: advance i_disksize to i_size upon
 disksize-grow I/O completion
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-25-yi.zhang@huaweicloud.com>
 <20260814102545.E85101F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814102545.E85101F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The EXT4_STATE_DISKSIZE_GROW_PENDING state bit is never set anywhere in the codebase, rendering the entire disksize-grow logic and safety mechanism inert.
> --
> 

This is a false positive. EXT4_STATE_DISKSIZE_GROW_PENDING is set
in patch 28. This patch is just preparing for that functionality.

Thanks,
Yi.


> --- Patch [24]: [PATCH -next v5 24/32] ext4: advance i_disksize to i_size upon disksize-grow I/O completion ---
> commit d834c25602b493451d52cc75b3ae8fd40461bce9
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: advance i_disksize to i_size upon disksize-grow I/O completion
> 
> This commit updates the iomap writeback path to advance i_disksize to i_size
> upon completion of a disksize-grow I/O. It introduces an is_disksize_grow flag
> to ext4_iomap_wb_update_disksize() to trigger this update safely.
> 
>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 955ff88045db6..4f1176b9332f2 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
> [ ... ]
>> @@ -589,9 +589,36 @@ static int ext4_iomap_wb_update_disksize(handle_t *handle, struct inode *inode,
>>   	 * i_data_sem.
>>   	 */
>>   	down_write(&ei->i_data_sem);
>> -	new_disksize = min(new_disksize, i_size_read(inode));
>> +	i_size = i_size_read(inode);
>> +
>> +	/*
>> +	 * EXT4_STATE_DISKSIZE_GROW_PENDING is cleared when the pending
>> +	 * I/O completes. However, another thread may have re-set the bit
>> +	 * between that point and here, meaning i_disksize has already
>> +	 * been advanced and a new EOF zeroing has been initiated. In that
>> +	 * case, do not advance i_disksize to i_size; leave it to the
>> +	 * next pending grow ioend.
>> +	 */
>> +	if (is_disksize_grow &&
>> +	    ext4_test_inode_state(inode, EXT4_STATE_DISKSIZE_GROW_PENDING))
>> +		is_disksize_grow = false;
> 
> [Severity: High]
> Is EXT4_STATE_DISKSIZE_GROW_PENDING actually set anywhere in the codebase?
> 
> It appears this state bit is never set, such as during EOF zeroing in
> ext4_block_zero_eof() where there is a TODO comment about tracking the
> ordered range.
> 
> If the bit is never set, ext4_test_inode_state() will always return false
> and this safety check will be bypassed during concurrent fallocate and
> truncate operations.
> 
> [ ... ]
>> @@ -607,6 +634,8 @@ static void ext4_iomap_finish_ioend(struct iomap_ioend *ioend)
>>   	loff_t pos = ioend->io_offset;
>>   	size_t size = ioend->io_size;
>>   	loff_t end = pos + size;
>> +	unsigned long io_mode = (unsigned long)ioend->io_private;
>> +	bool is_disksize_grow = (io_mode == EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO);
> 
> [Severity: High]
> Is EXT4_IOMAP_IOEND_DISKSIZE_GROW_IO ever assigned to ioend->io_private?
> 
> Because the EXT4_STATE_DISKSIZE_GROW_PENDING bit is never set, it seems
> ext4_iomap_get_disksize_pending_range() will always return 0, meaning this
> io_mode flag is never assigned.
> 
> Does this render the entire disksize-grow logic inert?
> 

