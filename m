Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591027;
	b=GqMiaaJAPSG4GPWPanUJwMScOZ5+IxPr+fgLpMp4jSBhG5QcBlyKxCfDiRPmxUiwyjkk
	 r9BujxhZnCn8SMLnPEitP1dyCivMyZtOZnubcd+y9MSCARbW2LlBXuoDh2zlWp95r04Yp
	 3R/c3drIUa+y+akOdq2MyjN4BL490n+HfBaceJJ1OSU61nBlpV+UKA8AZGCF0cQdVC4AV
	 HOAGC4czdsPkJHJACjS2ef/B9BG263LilrwPUaTvxfpRvFKwCZqM1lGnfc7JPeu1647Q+
	 DewO7YXV7MtYIMDPqhcvajYjpCknhqZORvDsRG1i/ltUGftfTExCZYwJ2C/7SnEz01w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591027;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uYIVrWzPo//3ycnzcjtC3NLTlGbn7jlYXamYf2N1qeo=;
	b=Lw6fD8ax0yVruP/aEJt+dnG200EqIL9W/SozYsIqFxBdBpUy2GjT02D8rUqmQOH9K/Ak
	 PV5m8SNthtKgsVlgMarJCR0FRY4+hziTLL1wX7wiYCS3mqYVjWigzdyDFw4HvAtylMI8d
	 8TdzoN7QPmxhjZAD4N0usIep6gS0bKnpvFXHeX5815o4oBzr2rSOXUeVtNevyJxPmiFKe
	 yE7dIbRmrTSZ5caIt4QMnL/GMnP4c82DVRxpO5TofiUCwV96RycvDmzcCZBKIOpEBuBNs
	 cjNCUwt+KgNBHT96n4FI77QvRMvYdRSoVcR2Vj5Jdce3QoPHzTwWRxF4WiJ97ydXYtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvEEO7Pb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217C6084342
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvEEO7Pb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9F71F000C6;
	Fri, 13 Nov 2026 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591027;
	bh=uYIVrWzPo//3ycnzcjtC3NLTlGbn7jlYXamYf2N1qeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fvEEO7PbZX9RLJuOyvqtICyI15grRVBoP5Vhqwy1TrZnWTnC6cmLty3RtNesmATOj
	 UoUxxUsunpASPnCoG8OhQJk5AQqxizkfaW15CHhKM2wgBXjxBC1k9Hw7kSaJq3Lh8m
	 oWZx38rtsy1yHFNP18MvSjlImV/d1/hBRUSekkSKsAjL4cyCeWweNTtF5j61d02/X5
	 14xMsfnen96iZsK9kAL4IPwUo+PgIV/4LoUwv0LrpgerkQ9RPbJqTep1wZB8Vp2UP6
	 77ijmJKWWl7EobHqPziUXXPCyBsCikKYBXOqm6WSP+H5uSg5lTNcAWBYzEYDVLUm9m
	 8WuCOuRVIqQ2A==
Message-ID: <79c3445e-623e-46ac-a09a-0a5d21f117c9@kernel.org>
Date: Fri, 13 Nov 2026 18:30:21 +0100
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <87y0aw8x7y.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 18:20, Roman Gushchin wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>> On 11/13/26 15:25, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found no new issues
>>> in this patch, but noticed 1 related pre-existing issue it does not
>>> introduce:
>>> - [Medium] mm: xarray node memory leak in collapse_file() [1]
>> Ignore this shit from Sashiko.
>>
>> Roman, make it stop.
> 
> David, will do.
> 
> But also it's not how I want to interact on mailing lists tbh.

Roman, just to be clear, I am talking about preexisting issues. We get bombarded
with preexisting issue reports. Having more duplicate reports posted to the
mailing list does not help anybody.

It creates more work for everybody. And the least I need right now is more work,
believe me.

> I understand everybody is stressed and overwhelmed by llms etc. Including
> myself. If sashiko is not appreciated in mm lands, I can turn it off,
> no problems from me.

Sashiko is great. The embargoed sending of mails to the list is great. I
appreciate all of that.

Posting preexisting stuff to the mailing list is not great, at least not right now.

We were very happy that preexisting issues went into the private bugtracker. I
want to delegate stuff to people in my team to screen them and see if it needs
fixing. Well controlled.

Now either:

(a) it was never really gone, and we were in disbelieve that preexisting issues
    are no longer posted publicly.

(b) Sashiko maintainer decided to re-enable it without consulting us.


I'm sorry if I made you angry, but I hope you can see how I suspect (b) and why
it would make me angry.

-- 
Cheers,

David
