Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3123183F
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 02:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786761227; cv=none; b=T2cB+ahTwO/wBFMZlIpZ3NCxIM+zN/6YrtFGdhS5lRHhQ9e1LFE6tqlZ802Q7ILmDbhU/D7jqYsSmNyIIq3q1BcHiSybxKEaPD4BFeQeVoyQuUlngLhzHkkmfi24fuDEY5MAZ7wRqqVIdlhGLPlitTmv+kNH0o1LNgUWUyE/vLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786761227; c=relaxed/simple;
	bh=iV4XDfJX+CFZbdszmcTiGj00Tjyby5tA1Vo+celIx7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H73/r4a02tOBH2pe0IK3wzvxllnX2HoYMyHg8z2dJYYhPcPWDpMM5KzVYOGddHU3ql9pGjYz/R5lh9rFMGkBmi/8rPr8r5lJ5Q8CyEL4RqDXEt8DdKW0Lv5A1p67CJgV7WbgLW9jpAlsw5d+m06XUYs4MOi7PEdno8xv0tfCrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kroKMND7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kroKMND7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1352605a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 19:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786761225; x=1787366025; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0Z8mCo+puk0a6hzRC+iz3VlA602gbMFooVLucdUKS8=;
        b=kroKMND7Oo0ZqSEwOPcL8IiYB62WX5aOkR2FkZ/oKfRGCebFXySXRxOLNLftzL5KrL
         YU2tLVwVDpcvLt3vHe+nBz0cVCkxJKbuZbQLsiacAXaAOyy6U5vn4KvrefvJKW2Lyznw
         abBbTzuhaPyLCsnrqg58FKW+xSu40vCvNey85VElMg88ltjgOA9mIqvTICmZAHSmh5zM
         W9rPLMl5VmANufsdZ0tiTEoNI4jUYOqT89CryNdKU3UlVZltyt0yeHJCRCHMCXt62lgH
         nbiY6EswG+/+SjuFNCK5k48skjn6xhQjiNgSIpU7F6tFEGi0PBDDLgWc6Sk21SIA0ED6
         QiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786761225; x=1787366025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0Z8mCo+puk0a6hzRC+iz3VlA602gbMFooVLucdUKS8=;
        b=iRogoGRlwSYwYVy41YTmC7AgUvq9xgqK2QFdn11Q5vmmAFzOxD5y0Nr5jsAr7beUhX
         +z4yH2T2CfCBFWPZOd4EKem+AXxxmK9zU1C+g/VGjxfkZKWBglam66pvSP/OZX1CvBmY
         CKD5fSTNZHoP5qhopm7BVyRxXqZ9C8vmQSkcMpNGK1thaiU3EynOq3BocB0UrTaQ0jjX
         JxtVptC6Nsy1ztZcuQpiR+jdhvT3yEocoxPhUXeVvJ0B1ITgSWITqYGtaNljvJnaRj4P
         +A3Ew0DFXIXmtDPvujtC47VkdwIdfVbh43ApNQ+3FkfKhkkBrd8Pva2XulnkIUNxLFFT
         QSJg==
X-Gm-Message-State: AOJu0YyYcQLyUIA7SsjhjgPxakeBNAb4G373r9WSRitNQeTw6eTjNw2l
	RMYFD3um2Iuud+ac1TlIbfri2b/LjToNpfQCajj2dKWEBcsz6VcP01JFDV3BeA==
X-Gm-Gg: AR+sD10gmTjl/A9F4qiZ5lnSD7WLIpBCoTzncwZb8u/EPGRRiAAA86ooBQ+kFrHRxTB
	j7YkyO4eT61GouJA5CFytV/RRFkILvijS7c9z8LFj38gj1CFIPIszHbI0tze4wMnUSk8fVeQ6ra
	b9oCDCyP59IXLoqtN7JsXQM76koE6XJKIjq1U6sTmKrXvss0RukTzjU93DzCTFOlh0FUyHQYaJ2
	hunwMPL5El6DcOaZ14MOpeIBiYadmNlt70qS02O3AhsTI27RX4bYUbys4bniMgCzwICVBuS+3/o
	K4K4BXAvEa54S5rG0YNzzDw6O1JHKlrbnX0iL5YDUz8jJ31LoCsA05wicvKdOu8HBjzCBOBVvXH
	/KE84XIvG/bV8jspgRRMNaqKJRVO6N4A+Sp9IHsd7/hEM8EqmUP5mSJ+lKOKe+t8QgpPR0hDgAY
	5I5DD244UzBMNvpfzDYSIndw+z12NCmMSx7/qUtM3mvgdNyFoIbelnIhwbB1MTjxm4hiyRXpPut
	UGsuLAJ
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr12272119a91.8.1786761224820;
        Fri, 14 Aug 2026 19:33:44 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9723casm4714661a91.2.2026.08.14.19.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 19:33:44 -0700 (PDT)
Message-ID: <3ba86c4d-ddc2-4716-bb4c-feb4b68bb6bd@gmail.com>
Date: Sat, 15 Aug 2026 10:33:17 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 03/32] ext4: simplify error handling in
 ext4_setattr()
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-4-yi.zhang@huaweicloud.com>
 <20260814101229.9F5201F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101229.9F5201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The patch incorrectly routes non-fatal errors from `posix_acl_chmod()` (and `ext4_truncate()`) to `ext4_std_error()`, triggering a spurious filesystem corruption response (DoS).
> --
> 
> --- Patch [3]: [PATCH -next v5 03/32] ext4: simplify error handling in ext4_setattr() ---
> commit f94f03ca7ff7f314c8faf61276a2cc51f78e4ce7
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: simplify error handling in ext4_setattr()
> 
> Refactor the error handling in ext4_setattr() to propagate errors using
> the existing error variable and jump to the common 'err_out' label. This
> removes the need for the redundant rc variable and unreachable checks.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 8654006a57eff..76bf0e944ebee 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> [ ... ]
>> @@ -6244,15 +6244,19 @@ int ext4_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>   		}
>>   
>>   		filemap_invalidate_unlock(inode->i_mapping);
>> +		if (error)
>> +			goto err_out;
>>   	}
>>   
>> -	if (!error) {
>> -		if (inc_ivers)
>> -			inode_inc_iversion(inode);
>> -		setattr_copy(idmap, inode, attr);
>> -		mark_inode_dirty(inode);
>> -	}
>> +	if (inc_ivers)
>> +		inode_inc_iversion(inode);
>> +	setattr_copy(idmap, inode, attr);
>> +	mark_inode_dirty(inode);
>>   
>> +	if (ia_valid & ATTR_MODE)
>> +		error = posix_acl_chmod(idmap, dentry, inode->i_mode);
>> +
>> +err_out:
>>   	/*
>>   	 * If the call to ext4_truncate failed to get a transaction handle at
>>   	 * all, we need to clean up the in-core orphan list manually.
>> @@ -6260,14 +6264,8 @@ int ext4_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>   	if (orphan && inode->i_nlink)
>>   		ext4_orphan_del(NULL, inode);
>>   
>> -	if (!error && (ia_valid & ATTR_MODE))
>> -		rc = posix_acl_chmod(idmap, dentry, inode->i_mode);
>> -
>> -err_out:
>> -	if  (error)
>> +	if (error)
>>   		ext4_std_error(inode->i_sb, error);
> 
> [Severity: Critical]
> Does this code now incorrectly route non-fatal errors from posix_acl_chmod()
> (and ext4_truncate()) to ext4_std_error()?
> 
> Passing a non-fatal error code like -ENOSPC or -EDQUOT to ext4_std_error()
> can cause it to treat the condition as a critical filesystem metadata
> corruption, aborting the journal and remounting read-only (or panicking).
> 
> For example, if an unprivileged user exhausts their quota or filesystem
> space, and then executes chmod on a file with a POSIX ACL,
> posix_acl_chmod() attempts to update the ACL, calling ext4_set_acl(), which
> may return -EDQUOT or -ENOSPC. This error is now assigned to the error
> variable and falls through to the err_out label, triggering
> ext4_std_error() and causing a potential local Denial of Service (DoS).

Yeah, if an inode shares its xattrs with another one, updating ACLs
will allocate new space and can return ENOSPC when we're low on space.
I'll drop this patch in the next spin. For later, maybe we can add a
helper similar to ext4_error_is_fatal() to filter ENOSPC, ENOMEM, and
EDQUOT, and only call ext4_std_error() for the real fatal ones. We've
got similar checks in extent.c, so we could probably generalize that
and share the logic.

Thanks,
Yi.

> 
>> -	if (!error)
>> -		error = rc;
>>   	return error;
>>   }
>>
> 

