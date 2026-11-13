Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591651;
	b=g2VEid3AY39l6s7nFn0JQLDKC0lbOTl7d2mu007chERSTFTFvG8LKbu2jiao/KYR9Mb7
	 CKYeXxjhOWvye55hQmbD7x7G1CZ07UICOEOtmVQ5igduJH+qyaLkGXUFzpJRZNxf2VBpJ
	 V1SBUNnLZL5A++UnaXBwo5gFlqzg2B0tUbLRZKb1IfNWte1MKpVBsnE+dDwXnRYL5opSi
	 mHUmF5nQWLyf21inlaW3YVUBQ43/stGUycd4/pBEOoIcdQ98zwZ5axOL8U2qYVwyQPxWO
	 P/+OgMu9SMmgA3PkMhUiUPHKcV4g3e4j4heu7BnQMg/Cp0R+NBhZPNm7EPa2ah8Bqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591651;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=U9C2gpc/O9t6+kPqP8v01Nu5WfJZ/IQBQy4m+7/b2yA=;
	b=yVK59CINQNev+jnKov/Ednd5KXdTWAFexIf4zKnV4NjH2+SWyrhLmVbLNe5kFXAAMQbf
	 ALuhk1ssPldTj3ZsontIMDBXhYl4NLhrZRERnG+jbjjWSu232W1Fa8MjhqsIMTOq/5tg0
	 szJKHe1hs5LEti2hxxdw8fBYy1qTtu5OlXry328Gcln41dCD1figJiUQNNUS5zEcf/gzf
	 zHKfsK+ARA6ihvqmloixIyds/QW2035N4X3q2XyOrwhO/4MnGmBu54fUPmA2NNY4ir5vp
	 ZzWaAlb0n22E3H0kUIK7yWTd3RpabkkqZC+VgdKtAxtP4dRnN8QJx98Ac+rpqPf4mrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLpH8XJy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242CB606F73B
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLpH8XJy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A9F1F000C5;
	Fri, 13 Nov 2026 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591651;
	bh=U9C2gpc/O9t6+kPqP8v01Nu5WfJZ/IQBQy4m+7/b2yA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=bLpH8XJyEvvSiuM10JJmp+bDW+f4W9jBhVjQNpC++yUjtyxbYX5RC/uYJo7j/lFxe
	 J/6lQSQ8ILF7y9OcDp7/sqJXQe5+zn3MwBEzW/cqzi/0LKkljhvr+gN6QskzklMdmV
	 7e1DuzYOemxwtTxdhkKIep1kTuZA+AWQUBrb8TyHs8ydaX4hqWzDGEEly7Z0G8QYU9
	 82nFCHJOo+oUXSVdQxIzpi3uShlyeqx3Fi+v5t28hoUub9jUPAOX22VP4TSDtVGeLt
	 W0O9OTtAve96jjcIGfkk/ay8BHTE57vQdiXin6CooGJgEJYDK2Cb2eCd/YUY3bxu2Y
	 HEGZeLnbUptFg==
Message-ID: <140b377d-571f-48b6-bd29-c8c65b78627e@kernel.org>
Date: Fri, 13 Nov 2026 18:40:44 +0100
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
Subject: Re: [PATCH] mm/khugepaged: reject shmem collapse ranges beyond i_size
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Roman Gushchin <roman@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
 =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Zi Yan <ziy@nvidia.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20261112142335.2749597-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <sashiko-outbox-212974@kernel.org>
 <5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org> <87y0aw8x7y.fsf@kernel.org>
 <79c3445e-623e-46ac-a09a-0a5d21f117c9@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <79c3445e-623e-46ac-a09a-0a5d21f117c9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 18:30, David Hildenbrand (Arm) wrote:
> On 11/13/26 18:20, Roman Gushchin wrote:
>> "David Hildenbrand (Arm)" <david@kernel.org> writes:
>>
>>> Ignore this shit from Sashiko.
>>>
>>> Roman, make it stop.
>>
>> David, will do.
>>
>> But also it's not how I want to interact on mailing lists tbh.
> 
> Roman, just to be clear, I am talking about preexisting issues. We get bombarded
> with preexisting issue reports. Having more duplicate reports posted to the
> mailing list does not help anybody.
> 
> It creates more work for everybody. And the least I need right now is more work,
> believe me.
> 
>> I understand everybody is stressed and overwhelmed by llms etc. Including
>> myself. If sashiko is not appreciated in mm lands, I can turn it off,
>> no problems from me.
> 
> Sashiko is great. The embargoed sending of mails to the list is great. I
> appreciate all of that.
> 
> Posting preexisting stuff to the mailing list is not great, at least not right now.
> 
> We were very happy that preexisting issues went into the private bugtracker. I
> want to delegate stuff to people in my team to screen them and see if it needs
> fixing. Well controlled.
> 
> Now either:
> 
> (a) it was never really gone, and we were in disbelieve that preexisting issues
>     are no longer posted publicly.
> 
> (b) Sashiko maintainer decided to re-enable it without consulting us.
> 
> 
> I'm sorry if I made you angry, but I hope you can see how I suspect (b) and why
> it would make me angry.
> 

And for the records, my request earlier that day (when I was less stressed ;) )
was a bit nicer:

https://lore.kernel.org/r/a78bd75b-dc4c-4007-b855-f1e58d2a435e@kernel.org

-- 
Cheers,

David

