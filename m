Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD5407CEB
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539714; cv=none; b=Si6pkYsVJVYx06n4lFHb3+QZJS1YzJl4WiN5F7YA4RrnAkKKUmSi6V2cQGdpEnJ16afPh8x8IynjQY5JdBA5W6mq1b8I0yj44NZ+5NqN0iA9/F2T5ytEpC96G1DwRR1J1YTLi6jhav0gdsJEpdJoCf6uL9LFaJJEsp+V1k9WlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539714; c=relaxed/simple;
	bh=H9nShDRqTCz1bGXhD3pKSiKXFh5nNqaH2RSpftTRtvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9hM8jpMZ66vW670yjl50sYRRcuA8WM9p5CNdeezdYj2kcoBksoGbWqLUodz3TV63KVxsvANH8b0WfRO6Jv1KnUDBUdxQ3Km3JySBcgdIiRtscz8X2Bbkd7gFondCc8Cq2AhW8JCbUNgzISAolwSaXYFOOHP8KUo8zCIHkxX8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8YEaIcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8YEaIcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D471F000E9;
	Mon, 15 Jun 2026 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539713;
	bh=FRkMbwVFG7ipwirEP3+OfCRo7yb0ur2K2jVhqfJXI+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T8YEaIcChW72QHt+U8CgnTN2j9H3yWeaaY6OIRWQj8858+kmCk9BFRy3GGkTD56Al
	 bliFFbfIecs01M6fhXmu4JFELijFOKAGSpsGzTrPEDdWJOzu9OqlHcQjx/X+ONxAIs
	 ntmBrU9znMCfI6UXk5uKVJc5qM/cw59libZ43ZYimZqHYy+RJ4AJy2CRG8nWXXc8Pq
	 YaSKGnZQHmSXCLlPly9L2KEVQjj4vB6mdPwFAP0Ckej/CMkcEyNWulWpid4QjPsnqr
	 KFC+opxPVlaHU894brtandUqTCBM/wAQkCDKD608lTQHMHK0LVtK33YGsF6rS1ChoC
	 S+67QstVkJy1Q==
Message-ID: <caf02e6a-06bf-4df1-b89e-9fe11ebd6a84@kernel.org>
Date: Mon, 15 Jun 2026 18:08:31 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] dax: plumb hotplug online_type through dax
To: Gregory Price <gourry@gourry.net>
Cc: sashiko-reviews@lists.linux.dev, linux-mm@kvack.org
References: <20260605211911.2160954-7-gourry@gourry.net>
 <20260605213143.A18F01F00893@smtp.kernel.org>
 <aiNFezMarbvIZNa0@gourry-fedora-PF4VCD3F>
 <878faef6-bbd3-43ec-af82-6da675a5f8fe@kernel.org>
 <aigyQcBH3HRrOn23@gourry-fedora-PF4VCD3F>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aigyQcBH3HRrOn23@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 17:33, Gregory Price wrote:
> On Tue, Jun 09, 2026 at 12:21:34PM +0200, David Hildenbrand (Arm) wrote:
>> On 6/5/26 23:54, Gregory Price wrote:
>>>
>>> @David - we talked about this ~6+ mo ago at this point, i originally
>>> proposed something like MMOP_SYSTEM_DEFAULT
>>>
>>> https://lore.kernel.org/linux-mm/20260114085201.3222597-3-gourry@gourry.net/
>>>
>>> https://lore.kernel.org/linux-mm/c4ed9675-269c-4764-86d5-87f4f83fc74d@kernel.org/
>>>
>>> '''
>>>    I don't like having fake options as part of this interface.
>>>
>>>    Why can't we let selected users use mhp_get_default_online_type() 
>>>    instead? Like add_memory_resource(). We can export that function.
>>> '''
>>>
>>> I guess the argument here is that the value can't be cached?
>>>
>>> But we can't really enforce that.
>>>
>>> This is a behavioral change we have to agree on (either we change it or
>>> carry something like MMOP_SYSTEM_DEFAULT for this).
>>
>> I don't think we'd need a generic MMOP_* for that purpose (the core cannot
>> really do a lot with that AFAIKS, and the scenario "unspecified" doesn't really
>> occur in memory hotplug core).
>>
>> I guess you could have some indication whether the user already configured it
>> manually (bool online_type_specified), and handle that in the handful of places.
>>
>> if (dev_dax->online_type_specified)
>> 	online_type = dev_dax->online_type;
>> else
>> 	online_type = mhp_get_default_online_type();
>>
> 
> Hm, I suppose this would do it.
> 
> I'm using -1 as "DAX_UNPLUGGED" at the moment, but I could actually just
> add MMOP_UNPLUGGED as an explicit mode which only has relevance to callers
> of hotplug (the state of the hotplug region they currently control is
> MMOP_UNPLUGGED) - but not to hotplug itself (memory_hotplug.c doesn't
> use it / rejects it).
> 
> Then i could use (dev_dax->online_type == -1) to mean "use system
> default"
> 
> I'll bring this up in the mmop/str patch whether we should add
> MMOP_UNPLUGGED.

Yeah, but I think it would be best to leave that out of the core. The value
doesn't make any sense for the core.

[...]

>>
>> But the question really is which semantics we would want? is that exposed to
>> user-space somehow, such that the user could query it ("default")? or how does
>> this get set, and how does it later get used while it could have changed
>> system-wide?
>>
> 
> I think this is the core question.
> 
> What selection of these values do we want?
> 
>   echo default        > .../dax0.0/hotplug  # -1
>   echo unplugged      > .../dax0.0/hotplug  # MMOP_UNPLUGGED
>   echo offline        > .../dax0.0/hotplug  # MMOP_OFFLINE
>   echo online         > .../dax0.0/hotplug  # MMOP_ONLINE
>   echo online_kernel  > .../dax0.0/hotplug  # MMOP_ONLINE_KERNEL
>   echo online_movable > .../dax0.0/hotplug  # MMOP_ONLINE_MOVABLE

BTW, should this then be called "/state" ?

In that sense "default" doesn't really make sense. Memory can be unplugged. It
can be plugged+offline, "plugged+online" etc.


> 
>   echo default        > .../memoryN/state   # -EINVAL - nonsensical
>   echo unplugged      > .../memoryN/state   # -EINVAL - nonsensical
>   echo offline        > .../memoryN/state   # MMOP_OFFLINE
>   echo online         > .../memoryN/state   # MMOP_ONLINE
>   echo online_kernel  > .../memoryN/state   # MMOP_ONLINE_KERNEL
>   echo online_movable > .../memoryN/state   # MMOP_ONLINE_MOVABLE
> 
> And lets say the use sets a value, should they be able to return it to
> the system default?  I don't think that makes much sense, considering
> the default is really only used on probe.
> 
> i.e.:
> 
>   cat .../dax0.0/hotplug                     # default
>   echo online_movable > .../dax0.0/hotplug   # online_movable
>   echo default > .../dax0.0/hotplug          # -EINVAL?
> 
> The point being that .../dax0.0/hotplug doesn't exist unless the dax
> device is already bound to kmem - and so by the time you can set it, the
> point at which (hotplug == default) being useful is already passed.
> 
> Does this seem reasonable?  The tl;dr is

I'm still confused about "default". As you say, once user space sees it, it
should already be either unplugged or plugged(and onlined or offlined)


-- 
Cheers,

David
