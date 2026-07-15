Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B843A302149;
	Wed, 15 Jul 2026 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148400; cv=none; b=ELK1unaQXQ6YtMcNnVz+6Mbc4G6Ah0AWbceJVrRV+PMDcexc1WJIVV+1kHC2j+jWL0aRChhgpUznb9z/PxOFYay4Es4cW6wkY55HlYgj2AyyG6CADxCWXafYEdpuXYfaU1J+vxvKcazDVxa2Gbbg4fRBRnSg2dP7jxlNMpgMAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148400; c=relaxed/simple;
	bh=+Jwszswhw1ZXgx9jt6vgiNqsibTmv9QYm3AISbx34ms=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SYiXeXl9IKYz1+My8Ek26RqUKllJlmzy++alL7I21XXBa8c4UytpNWkldivzwI5eA3ne/wpdYXQXmao7IOUAyhrrK2VuqAZv7R+SY7HGtbOm918XOqIOxCDufMWSeyPMojKMFkaNMD2M/FxjaprT13nkkQu26R3ghMvvAfQZf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=H37+1jXu; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="H37+1jXu"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8963100162;
	Wed, 15 Jul 2026 22:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784148395;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IxTC0PcmTi5Z0sUROFUes4Uwvb15X6CctNLo1ceG9Vs=;
	b=H37+1jXunekFsGDKykbUuwVhXzzPmHb+jpJgTli/Qk6AxJhfLnMUbovORA1zmRncdANPQQ
	y5WyeqlLmQF5KjFj05h36fOCJiKU8Brybv+OmiFL6iIeEuHiLKgHdulGuQK8IO9UsfvpUh
	1EOqWDpZ2qelHCZ16tWLxD1YgJQ0Sy6xabv1oMWLiF/AZrXSctRofuGCK1ZiKG9dUmpJXD
	0CFCD77B0zT2th9d+9xu7UwygobpoTHaxcs6GzGt6QbrsKFJNXKIcUkQQ+Y6UGpFLy4Czp
	HxO6cgmpmnTO5jJsQ45W8nIKRg5SyZDlUVDJWksbPBPcCyP9pqqP+II2oDkXSw==
Message-ID: <c9a67cbd-fda8-4016-9cff-9125f3191b74@nabladev.com>
Date: Wed, 15 Jul 2026 18:38:32 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
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
Content-Language: en-US
In-Reply-To: <alezsOsf61Zv6F4F@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/15/26 6:22 PM, Frank Li wrote:

Hello Frank,

>>>>>> [Severity: Medium]
>>>>>> Will this node name bypass the driver's carveout exclusion logic?
>>>>>>
>>>>>> Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
>>>>>> specifically for the name "vdev0buffer" to skip processing the vdev buffer:
>>>>>>
>>>>>> 	if (!strcmp(it.node->name, "rsc-table") ||
>>>>>> 	    !strcmp(it.node->name, "vdev0vring0") ||
>>>>>> 	    !strcmp(it.node->name, "vdev0vring1") ||
>>>>>> 	    strstarts(res.name, "vdev0buffer"))
>>>>>> 		continue;
>>>>>>
>>>>>> Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
>>>>>> it will be mapped as a generic carveout via ioremap_wc() and unintentionally
>>>>>> included in the remoteproc coredump.
>>>>>>
>>>>>> Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
>>>>>> and bloating the coredump?
>>>>>
>>>>> Look like make sense, please check it.
>>>>>
>>>>> It is not good to use node-name as ABI. Laurentiu is working on use
>>>>> memory-region-namses.
>>>> The memory regionss are referenced from imx8mm-cm4 { } node via the
>>>> memory-region property:
>>>>
>>>> memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>>>
>>> I known, but now code parser node-name, At your case, it.node->name is
>>> vdevbuffer, but driver expected vdev0buffer.  so above check will be failure.
>>>
>>> suppose it should be
>>>
>>>    vdevbuffer: vdev0buffer@b8400000
>>>                ^^^^^^^^^^^
>>>
>>> I know it is bad, but waiting for Laurentiu to fix it.
>> Actually, if I look at "git log -p drivers/remoteproc/imx_rproc.c" in
>> current linux-next 20260714 , which has the entire history of imx_rproc.c
>> and the latest content, the code cited by the AI:
>>
>> "
>> 	if (!strcmp(it.node->name, "rsc-table") ||
>> 	    !strcmp(it.node->name, "vdev0vring0") ||
>> 	    !strcmp(it.node->name, "vdev0vring1") ||
>> 	    strstarts(res.name, "vdev0buffer"))
>> 		continue;
>> "
>>
>> never existed in imx_rproc.c:
> 
> AI refer old version code, but problem is the same

No, sorry, the aforementioned piece of code never existed in imx_rproc.c 
according to git log. There is no old version of the code that looked 
anything like what the AI produced above.

> if (strstarts(res.name, "vdev0buffer"))
> 
>>
>> "
>> $ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | grep
>> vdev0vring1
>    ^^^^^^^^^^
> 
> vdev0buffer

The AI generated review content above does refer to vdev0vring1 , which 
is a unique identifier, but that unique identifier exists only once is 
the entire history of drivers/remoteproc/imx_rproc.c and that is as a 
code comment . That proves my point that the aforementioned AI generated 
review feedback is not based on code that ever existed in the kernel.

>>      vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
>> "
>>
>> It seems the AI hallucinated something which is not based in reality ?
> 
> git log --follow -p linux-next/master -- drivers/remoteproc/imx_rproc.c | grep vdev0buffer
> -		if (!strcmp(it.node->name, "vdev0buffer"))
> +		if (strstarts(res.name, "vdev0buffer"))

"
if (strstarts(res.name, "vdev0buffer"))
"

and

"
	    strstarts(res.name, "vdev0buffer"))
"

looks like different code , and the AI reported "strstarts(res.name, 
"vdev0buffer"))" which never existed in drivers/remoteproc/imx_rproc.c 
as is clearly visible from the command output you shared above.

So, what exactly is the problem here , can you please clarify it without 
referencing the AI generated content above ?

Thank you for your help !
