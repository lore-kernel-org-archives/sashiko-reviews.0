Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93954340A57
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786788265; cv=none; b=udLgJXK6qBt1RbhPNtOBU3RrEP8+NE8XzZqvRBnv5C7TNIwtYDFE+GJ83u1G1/HfGGX4JjeMnjmrW88bb/ADT2wa1nC8FQxtuDIDO0F/75O2GC4o/fNT1tLPw63WtobntZREIaSU9zllkRd8zm1Ll45CzEXM/PcVf+s4bN8tEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786788265; c=relaxed/simple;
	bh=lm1cnI1mVhfNqcyNMCGp02rnluBKDwu6KOP7Lq68qp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiAAVugopkHgP5+hEWc68HX79Ozfh2LZ7SACzoFAjRG07I2n80OytytnNF2AbZHFQl8pNHOLO3vY45vIAtYmyk+Na/mu1WOI04qv6GRHu97ZwhJNf7rqf/W6ta+AuxgOKParFr/DJQFckfIyd28KrMJ4GRevKwd/gydeRdbiQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3H0iiqa; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3H0iiqa"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e507b079dso1156406b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786788264; x=1787393064; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU+UAzKl+KW6dM65ADSCUzY3+zuzNPfx09r5Ls+5rio=;
        b=I3H0iiqa5tLwibmdk3TlsTOoYNRf9tJlGk5CxzFogrL4rb6NF648FF52qkBEwoIlHp
         TT6GsNeZWje6iRhJEHWq6LZG72SXovE5oFSxZbuvC53SjJo5IUVjk/fxmCYGmRWZZaCf
         xmuA3ONxas5yDeED5qijPWYGaRiQvjKTEjNvzD7vdIvtigrZrgJZpzYqYof7dcrcnpLl
         xyStP/DgnplW7J7S99FfRR6h8jisHVenr05tRg/YQSdgTbvU7uL2CMd0uqKux88uHWl/
         Q6ImgDCB7o4IEVx9I9DuTVQs2FoEMZZFMQi+RlX6Ka+6KRVASHt8XsEArI4U6C4opQue
         SRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786788264; x=1787393064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU+UAzKl+KW6dM65ADSCUzY3+zuzNPfx09r5Ls+5rio=;
        b=OtYSIT2qgEkyPDh03djkOfrd2KK/eNHCYJ1dUxVARtZCgI+xicEL4B0lC6It/aF3/C
         IPmMGt3ryiATVNha8GeU0sGymgc36Tk44PTY4tRgk2IkhogxI+4x19mFIFxJnzizlLLN
         H5k7/wELX22nNbzhF/6HdmFh6jrKBYMt8WMYmFGuLgqTlH7/MST9vb6pRg+97Sc94Edq
         RFbv/64MPzWyOmwf5HyzvZsHG+UFWAOgjadDEsW2PwZQwxakZ+ZrphRaPDSq6LGJpIf9
         iON3oVq/zwDdkCHE8Vc6HkA6+FIF/WRfkHk+X8W6x2zY7RqAwlvUGjDVCan/CfhKgSqJ
         4Bjw==
X-Gm-Message-State: AOJu0YwoCaegucSK1Yq+5ilye6xVyeCxnHgjPKuyR+1hZtOWGuGnScLJ
	2HE47uFvZimSvbJL8YedpxM0erIeI0Gn8IlfUKHLEegVe+V8dEKPywoqh8YuK5Zi4M8=
X-Gm-Gg: AR+sD11sDupVkHWcVcEy87FntdDnUNerqnhSHs7MJr6HbPXEWK5g18/gKzoOasFQrVO
	kNEKYBLTDOzzUaMVEmqTGKhTd7BdTDbpQDt2x4RWR5N2G0Vq9YJWz67Wmt3Lvoh5tKh/5IZDbx0
	Zkemh2R+nerL8r0QZiu8EEfCAHsNysVE9J/eDLcE9mIC0n4oyFCXv4VCUyuOACipPLdz+evdHty
	Jl4oA6Y8/FjpoCHfgb5Boubig00j1vDEEKo1iN9jlY0F6nwcHaUn/hIWimJudNxHr/OA3EjiHDI
	TiT928gBc12nuFUGyVeLAl9yHd06Xq8ZAwE3mYkrJ+p8xia2+AwrfMXGxuvN107NcvSoFvl8bwQ
	AqdFlYznxItkvtyjaioC0H83dz2mty0RuhxUoNlLbwQk/a8u7qqmNNVe84+rPUg6nYLXo+PBnti
	TSx2VaY1dQP4NtQRYUYODlhSVyoFYB/uEzWrmWHHIGq3PAfCO7Jc/JsBLuyFRX5CMTS4Emi1jFD
	25WSmwp
X-Received: by 2002:a05:6a00:4193:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84fde1500e7mr13333285b3a.6.1786788263768;
        Sat, 15 Aug 2026 03:04:23 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc09fa8c128sm1637490a12.32.2026.08.15.03.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 03:04:23 -0700 (PDT)
Message-ID: <7aa2a7a6-02a3-44db-99f7-9b1a3a3cc313@gmail.com>
Date: Sat, 15 Aug 2026 18:04:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 07/32] ext4: fix orig_mlen initialization in
 ext4_map_blocks()
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-8-yi.zhang@huaweicloud.com>
 <20260814100852.164CF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814100852.164CF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] If ext4_issue_zeroout() fails during block allocation with EXT4_GET_BLOCKS_ZERO (e.g. via DAX hole-filling), the newly allocated WRITTEN extent is not reverted, exposing uninitialized disk data.
> --
> 
> --- Patch [7]: [PATCH -next v5 07/32] ext4: fix orig_mlen initialization in ext4_map_blocks() ---
> commit 547294dd62d03f6ea5caef0d90e340b0af933eae
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: fix orig_mlen initialization in ext4_map_blocks()
> 
> This commit fixes an overflow protection bypass by ensuring orig_mlen
> is saved only after clamping map->m_len to INT_MAX.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> @@ -719,6 +719,7 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	 */
>>   	if (unlikely(map->m_len > INT_MAX))
>>   		map->m_len = INT_MAX;
>> +	orig_mlen = map->m_len;
> 
> [Severity: High]
> This is a pre-existing issue, but while reviewing the block mapping code in
> fs/ext4/inode.c, I noticed a potential data exposure when DAX hole-filling
> writes fail to zero blocks.
> 
> If ext4_issue_zeroout() fails in ext4_map_create_blocks(), the error is
> returned immediately without reverting the extent tree modification:
> 
> fs/ext4/inode.c:ext4_map_create_blocks() {
>      ...
>      if (flags & EXT4_GET_BLOCKS_ZERO &&
>          map->m_flags & EXT4_MAP_MAPPED && map->m_flags & EXT4_MAP_NEW) {
>          err = ext4_issue_zeroout(inode, map->m_lblk, map->m_pblk, map->m_len);
>          if (err)
>              return err;
>      }
>      ...
> }
> 
> This error propagates back to ext4_iomap_alloc(), which aborts the operation
> but proceeds to commit the transaction anyway:
> 
> fs/ext4/inode.c:ext4_iomap_alloc() {
>      ...
>      if (ret < 0) {
>          ext4_journal_stop(handle);
>          return ret;
>      }
>      ...
> }
> 
> For a DAX write to a hole within EOF, the extend flag evaluates to false in
> ext4_dax_write_iter(). This completely bypasses the cleanup path that would
> otherwise drop the failed extent:
> 
> fs/ext4/file.c:ext4_dax_write_iter() {
>      ...
>      if (extend) {
>          ret = ext4_handle_inode_extension(inode, offset, ret, count);
>          ext4_inode_extension_cleanup(inode, ret < (ssize_t)count);
>      }
>      ...
> }
> 
> Because the newly allocated extent was already inserted into the extent tree
> as WRITTEN by ext4_ext_map_blocks() earlier in the call chain, could this
> sequence leave uninitialized disk data mapped and exposed to userspace?
> 

Yeah, this is an pre-existing issue. In DAX mode, if issue zero fails,
we should clean up the allocated blocks on the error path.

Thanks,
Yi.


