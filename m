Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E272D3EEB
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881796; cv=none; b=agucSA1Gp+iKNLmcEq9wiOf9EGGf3adcf71Y+Xh4C72QwrX8NfCf8mDL2FFQB2H3gGPAnZJP6P62howUIKfCrZ/IFIz0gWghbSWOV5gRmuS/51+HRN0pDpWMKabZWYTrrDGt0WR8lcHzCjKTLPzj9vfxb9sU6MV8eCuE20vQvdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881796; c=relaxed/simple;
	bh=eucM747RovHig5EMyBbZYOtolEwlJNF8D2Ih04WGVdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbnCxdDjSH3EKoMKhK+xSISv0aFvaeldfNq600XqbALKhSj3TwXZHaSQ0h5f0rSPMkT+slkhfs6Nf2nYDFZJJv1GgZkQUQmTBXngi2H8hhr9iLRCasBvz9xzLmd9OOF/yzl2Lf4+WmD3TqW4nM5tLxcqLT+8OWat/LuQLTtFPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RveU329B; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RveU329B"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eucM747RovHig5EMyBbZYOtolEwlJNF8D2Ih04WGVdY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787881790; v=1; x=1788486590;
 b=RveU329BNtI7q8Azu7CbUhJFBHkkoDGcWUyEOWxqC2Z5i366lTGGYCDWVr7p0LS5nRwhrqsX
 8d0znjvTneaU/Ty1aoguiw+8M9eLCAWiNLpRF/c5/zSs07A/lM9aDnbK+WHpYrI1scygPpLx7SG
 QsjA/K9oy90JxxcALMNfvBBY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a00269d0398ad22b;
	Fri, 28 Aug 2026 01:49:40 +0000
X-Mizu-Trace-ID: a00269d0398ad22b
X-Migadu-Flow: FLOW_OUT
Message-ID: <45518155-3a29-48c4-89bf-40d81c2ef6d6@linux.dev>
Date: Fri, 28 Aug 2026 09:49:34 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: sashiko-reviews@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)"
 <linux-mm@kvack.org>
References: <20260826133054.88529-1-ridong.chen@linux.dev>
 <20260826134733.051941F000E9@smtp.kernel.org>
 <0c606cf9-2b5a-4549-8ab1-0be619487412@linux.dev>
 <apABJglqDFcB02VO@localhost.localdomain>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <apABJglqDFcB02VO@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/27/2026 5:26 PM, Michal Koutný wrote:
> Hi Ridong.
> 
> On Thu, Aug 27, 2026 at 09:29:13AM +0800, Ridong Chen <ridong.chen@linux.dev> wrote:
>> On 8/26/2026 9:47 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>
>>> Pre-existing issues:
>>> - [High] Integer overflow in `effective_protection()` calculations on systems with >= 16TB RAM.
>>> --
>>>
>>
>> Thanks for the careful analysis. You're right that this is pre-existing in
>> effective_protection() and not introduced by this patch.
>>
>> I'm not sure it's worth fixing in practice, though — the overflow requires
>> systems with >= 16TB of RAM, which I've never encountered
>> myself. So I'd rather not fold a fix for it into this patch.
>>
>> I'd like to hear the maintainers' thoughts on whether this is worth
>> addressing separately.
> 
> Machines with >=16 TiB aren't completely out of reach [1]. Then
> configuring such protections to attain the overflow is another
> condition, so I'd consider this a nice to have but not a
> pressing fixup (separately, with thorough review of occurences where
> total page counts/bytes might get multiplied).
> 
> HTH,
> Michal
> 
> [1] E.g. https://aws.amazon.com/ec2/instance-types/u7i/

Thanks Michal,

It's worth fixing now, I'll send a separate patch to address it.

-- 
Best regards
Ridong

