Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97E36DA0D;
	Thu, 16 Jul 2026 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180374; cv=none; b=gxyCQkwoQU1l+sWqKnFzADyjEGSc5Q//qjBdNRkbStY0eH/ds4J7L9t+sZwcHhII83hRaSxVeH7342fns/5QNoi3oabSlBnKkojV6m48NfNHp2O1R3qG1M7dMk6t6eDhnI7Kx37klF0ylfKVWEDdygEv3XJeLcI+y8MOPiRvl6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180374; c=relaxed/simple;
	bh=OzV8K/HP/1iZwZHlRvlRr551cc6p86QiqmtxfigEHxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOj8PeAmykeVXV0xZtxwT0aukzC1Ew7MrEOyC0kBq1gnmeTgg7QCoNILGUis85CZefDG3PugvJU8gB9q55VwUYX7XwAOm/9xZu/G5Pgmv/fwEX+O4yP4ndGMu5YYJRsSacrqnEI4VFG4HwizMPZ8lE54WymaMU7+vD2qBkUqffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=CT5qQ7Fm; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="CT5qQ7Fm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D623119B41;
	Thu, 16 Jul 2026 07:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784180363;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PpI4q3/2Dkx3mceJVBfFoGBFN2uhwy2+sNYNJl9A4qk=;
	b=CT5qQ7Fm3RrmYQ6t4IfCGZOkLydtHieEXKtkDtihEPfVoV01gCIuEJG8wVb0hDZYq1Pqgk
	Z4cnS04qkn3pFirZaBf2EHJYs8RUDMzpoWWOOQuqf9vQif1wv/eUSpGQI4LoWw7FraRYHB
	tL/CRORnPXgEE8WlD9ch7pglt0LmE55MtuzCRoKJLqYOJu+oXO679a6kVow19sgE3nTj6V
	JV96k1s0OMYf3lxfpP8xyNS3ZfT6pFzo9gcH8Td1iB7c4asxzvLda5GNcKsqdrRIFyuSxQ
	a3KjjxW7dVobbA5SVVaBpKlTJd6p12XgBngHRH1+Y/akGsE+KPdib7C04q9Jqg==
Message-ID: <56953f06-2e3d-4137-a51a-ed91e9b0d577@nabladev.com>
Date: Thu, 16 Jul 2026 01:30:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
 imx@lists.linux.dev
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org> <alUICTI-24tREZO8@SMW015318>
 <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
 <alWR66rjt-9jGEOV@SMW015318>
 <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
 <alezsOsf61Zv6F4F@lizhi-Precision-Tower-5810>
 <c9a67cbd-fda8-4016-9cff-9125f3191b74@nabladev.com>
 <alf9pp3c_zI4rwC0@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <alf9pp3c_zI4rwC0@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/15/26 11:37 PM, Frank Li wrote:

Hello Frank,

>>>>>>>> [Severity: Medium]
>>>>>>>> Will this node name bypass the driver's carveout exclusion logic?
>>>>>>>>
>>>>>>>> Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
>>>>>>>> specifically for the name "vdev0buffer" to skip processing the vdev buffer:
>>>>>>>>
> ...
>>>>
>>>> never existed in imx_rproc.c:
>>>
>>> AI refer old version code, but problem is the same
>>
>> No, sorry, the aforementioned piece of code never existed in imx_rproc.c
>> according to git log. There is no old version of the code that looked
>> anything like what the AI produced above.
>>
>>> if (strstarts(res.name, "vdev0buffer"))
>>>
>>>>
>>>> "
>>>> $ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | grep
>>>> vdev0vring1
>>>     ^^^^^^^^^^
>>>
>>> vdev0buffer
>>
>> The AI generated review content above does refer to vdev0vring1 , which is a
> 
> No, AI talk about "vdev0buffer" at beginning, never said vdev0vring1 at all.

This is the code the AI quoted in the review feedback:

"
	if (!strcmp(it.node->name, "rsc-table") ||
	    !strcmp(it.node->name, "vdev0vring0") ||
	    !strcmp(it.node->name, "vdev0vring1") || <-------- HERE
	    strstarts(res.name, "vdev0buffer"))
		continue;
"

It does not matter which identifier we use to look up the AI quoted code 
snippet in git log, the important point is, that the aforementioned code 
snippet never existed in the Linux kernel as far as I can tell.

But as far as I understand this, I should adjust the DT to cover the 
test in the aforementioned non-existent code snippet ?

> "   Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
>     specifically for the name "vdev0buffer" to skip processing the vdev buffer:
> "
> 
>> unique identifier, but that unique identifier exists only once is the entire
>> history of drivers/remoteproc/imx_rproc.c and that is as a code comment .
>> That proves my point that the aforementioned AI generated review feedback is
>> not based on code that ever existed in the kernel.
>>
>>>>       vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
>>>> "
>>>>
>>>> It seems the AI hallucinated something which is not based in reality ?
>>>
>>> git log --follow -p linux-next/master -- drivers/remoteproc/imx_rproc.c | grep vdev0buffer
>>> -		if (!strcmp(it.node->name, "vdev0buffer"))
>>> +		if (strstarts(res.name, "vdev0buffer"))
>>
>> "
>> if (strstarts(res.name, "vdev0buffer"))
>> "
>>
>> and
>>
>> "
>> 	    strstarts(res.name, "vdev0buffer"))
>> "
>>
>> looks like different code , and the AI reported "strstarts(res.name,
>> "vdev0buffer"))" which never existed in drivers/remoteproc/imx_rproc.c as is
>> clearly visible from the command output you shared above.
>>
>> So, what exactly is the problem here , can you please clarify it without
>> referencing the AI generated content above ?
> 
> The problem is simple, node name should use
> 
> 	vdevbuffer: vdev0buffer@b8400000
>                          ^
I see.
