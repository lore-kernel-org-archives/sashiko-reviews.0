Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E73ECBD9;
	Tue, 14 Jul 2026 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069499; cv=none; b=T7Td5NY1uyDeNKtHIc7ikVGcyf0xzghs1MA6ZBnvjFiB6RWWZacFgCPelpjnIpWtpbBYyrJUkp+42Uu6hNAE61K7+FPhgEk3mApQtusxIDxijNYnA/1VRuUs+jAlp011BUdWaeCgu9phyDJti70ViRWueurnq3Pp/v+CP2ZzRgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069499; c=relaxed/simple;
	bh=Up9898goBUiMUkw/XboqiGUJMigAXOWBOVGdW5oyLDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXC2DBuua+Z+9Xc2k5txly8Xr4RTuqI7E1RZMIQAuLt6AhZP5cfYtThA9egBu9V9GpHfDrVqxlnnoJRJ8jWVXkjRIOwhCXsvJ3JEME3qTEzTMY1yBZZc0V7BMgWdoBvgzAEAbK1/XmOZUUgpBM6O9dsFJpXQGyS0Avg6L03bWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EH/tcO3c; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EH/tcO3c"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ECCB118727;
	Wed, 15 Jul 2026 00:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784069488;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JGJ7P9JE0QgzNJz4vJFVzGxVyrchjZ/YmcbKkfd9m1M=;
	b=EH/tcO3cBwilFRGqxYjJ6qkrWWZTRuMClOQ360jfWZDpfLE0FI/j5/I+HHo01EshT1yetv
	xUyOkhj0zqL7+h5MxuREVeQrtdgqwyBkCAOzbgfy2+2JGUINHT9iIB2vVTtLuxwyHKeodT
	YwuRXLKddnKCjcN49naJ2w02qRvKetUpqgVmaBPbpP+08sohZDW4/u7FURgXLTR2RXwLW/
	R6sGHCngU0pcGp5vG3c3MQCl+mLVNlW23+rd7AtwuPkJ8FYTrYSiH/YWHnZyMY/8yuoVc6
	E2ASZ1HQkpliNn5VCcldaYCIg1R1ZO+LhSXd9O7j0q9q6xeUf8KwxqvQT7j4Hw==
Message-ID: <a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com>
Date: Wed, 15 Jul 2026 00:51:26 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <alWR66rjt-9jGEOV@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/14/26 3:33 AM, Frank Li wrote:

>>>> [Severity: Medium]
>>>> Will this node name bypass the driver's carveout exclusion logic?
>>>>
>>>> Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
>>>> specifically for the name "vdev0buffer" to skip processing the vdev buffer:
>>>>
>>>> 	if (!strcmp(it.node->name, "rsc-table") ||
>>>> 	    !strcmp(it.node->name, "vdev0vring0") ||
>>>> 	    !strcmp(it.node->name, "vdev0vring1") ||
>>>> 	    strstarts(res.name, "vdev0buffer"))
>>>> 		continue;
>>>>
>>>> Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
>>>> it will be mapped as a generic carveout via ioremap_wc() and unintentionally
>>>> included in the remoteproc coredump.
>>>>
>>>> Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
>>>> and bloating the coredump?
>>>
>>> Look like make sense, please check it.
>>>
>>> It is not good to use node-name as ABI. Laurentiu is working on use
>>> memory-region-namses.
>> The memory regionss are referenced from imx8mm-cm4 { } node via the
>> memory-region property:
>>
>> memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
> 
> I known, but now code parser node-name, At your case, it.node->name is
> vdevbuffer, but driver expected vdev0buffer.  so above check will be failure.
> 
> suppose it should be
> 
>   vdevbuffer: vdev0buffer@b8400000
>               ^^^^^^^^^^^
> 
> I know it is bad, but waiting for Laurentiu to fix it.
Actually, if I look at "git log -p drivers/remoteproc/imx_rproc.c" in 
current linux-next 20260714 , which has the entire history of 
imx_rproc.c and the latest content, the code cited by the AI:

"
	if (!strcmp(it.node->name, "rsc-table") ||
	    !strcmp(it.node->name, "vdev0vring0") ||
	    !strcmp(it.node->name, "vdev0vring1") ||
	    strstarts(res.name, "vdev0buffer"))
		continue;
"

never existed in imx_rproc.c:

"
$ git log --follow -p next/master -- drivers/remoteproc/imx_rproc.c | 
grep vdev0vring1
     vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
"

It seems the AI hallucinated something which is not based in reality ?
