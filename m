Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2741A546
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141609; cv=none; b=mou8nKknBM1yja2DCWmpy9TmlcpxmzYB456VTpucBOWFs0CvWWaCWybC6BJNFAltFSWopFmm5a4TGcCZp34Zy/SSwy6nBxA6G44b7H+ZZvnRdByiXGpaJnsYWras0wA177EeJGI7b2ZOlEAsqEYcxmxn9Pl2XxQBxC15uKgTZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141609; c=relaxed/simple;
	bh=WPx8iG1mkNoOWxAWUpQnjW2UX2Szr3KjV2evdTXWYK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lY6W29iwhp3Impwb25VH6ejWz3kICX13xOORKrr40icj9UlA78tcnOHF+McEku4O0i+1Mk2HW+Ixjj5zjRU2yWr8pxuKAmxI9TTppLbSojX5swgSc9qolnWotKbi8I+kJ1rGzu7Xg2Dqyp/gcODVxR4E4Fk6fR+mFqzJ6WIhgaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=K3bCVxD0; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="K3bCVxD0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=dAwHgQXVEEzWF1crEa7NagLIyGjoO8/i1INCRs5hZkc=; b=K3bCVxD0t3/P/TMp+ArcAT8hBB
	Yul1o1gjzvE64/CVdlow9U5xwy8kokYNDB7w+F74pkbyEW15TiJKwMi8ZSUePwphXffJtJAJyfE/L
	PSwSp8XPa21SPW+eIg2l6bwbrQ2QfsQl0sHCSR9qERiAfHlR3SwIN25L12Cmj5liyfN42KYv+qN04
	OsCobrsEjMNepfPq58UliyNjaaBlbAK/k1jiz0xQ+rcufICrsFvhe6CL2KhGk/+wPVq5Gvw8qJmsx
	j1K6QKFNW3YNp2VSKqOP0gBMPf3TfQKnKJBsB/1IS0Y+YWo7zgnBxCb/SVhmtCxm2rpcXxN0UFe1r
	pSvLDokA==;
Received: from [179.96.247.152] (helo=[192.168.1.16])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wk4jQ-00FbHY-Kp; Wed, 15 Jul 2026 20:53:20 +0200
Message-ID: <f37ad3a8-3603-47ca-9947-a6e21be14e72@igalia.com>
Date: Wed, 15 Jul 2026 15:53:17 -0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ext4: skip i_extra_isize expansion during inode eviction
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu
References: <20260715175253.2171303-1-koike@igalia.com>
 <20260715181003.248CF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20260715181003.248CF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/15/26 3:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch introduces a build failure by using an undeclared function or macro `inode_state_read_once()`.

This is a false positive.

inode_state_read_once() is declared in linux/fs.h and is already used in 
other places in inode.c and it builds fine.

Helen

> --
> 
> --- Patch [1]: [PATCH] ext4: skip i_extra_isize expansion during inode eviction ---
> commit 118d9e758f25c66bbc15a2be5b297ae71d3991d9
> Author: Helen Koike <koike@igalia.com>
> 
> ext4: skip i_extra_isize expansion during inode eviction
> 
> This commit modifies __ext4_mark_inode_dirty() to skip expanding the inode
> extra isize when the inode is in the process of being freed. This avoids
> unnecessary work that will be discarded.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 03c2253005f00..ec31318c12d9d 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -5896,7 +5896,8 @@ int __ext4_mark_inode_dirty(handle_t *handle, struct inode *inode,
>>   	if (err)
>>   		goto out;
>>   
>> -	if (EXT4_I(inode)->i_extra_isize < sbi->s_want_extra_isize)
>> +	if (EXT4_I(inode)->i_extra_isize < sbi->s_want_extra_isize &&
>> +	    !(inode_state_read_once(inode) & (I_FREEING | I_WILL_FREE)))
> 
> [Severity: Low]
> Does this code introduce a build failure? It looks like the macro or function
> inode_state_read_once() is undeclared when called here in
> __ext4_mark_inode_dirty() in fs/ext4/inode.c.
> 
>>   		ext4_try_to_expand_extra_isize(inode, sbi->s_want_extra_isize,
>>   					       iloc, handle);
>>
> 

