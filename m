Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C42E0B5C;
	Fri, 31 Jul 2026 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513389; cv=none; b=VOSUkpbMzUPixcBx45r/LOWUrGWeQPmdbCF8meSrT9SksuxS37J+WTysoIE8xYAHDEEcwb1hmeQdU8/jAQR3omtjJn9S2Cuk9pZuDMaYAGetFUAXg+UmNPb0kDyeXHogAL+ob7DGhfXfibUf1jIbpVQ6aF/XvIC5/A8jm84l0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513389; c=relaxed/simple;
	bh=wxYLT89ZumPuz99b6PJmN0odN0KfoDn/BWbg6Q8a92g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZhbA5K462yaw5ICN8BOVL+6ZaBvPxDKVFEmMDVr9ZLAscM0ZZUxx0nSV1JBqr7IWScZAmgJMV7NWHWXSDXjBdwPiMGCTlEnaqGng+Dn2B5TArv5So5I+SYAYXeW1kxqUYADIje7cxn36snSKmgN9H+jcvxS94vrBE22IUw2q8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=jn+plKJB; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="jn+plKJB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FD4111B7FA;
	Fri, 31 Jul 2026 17:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785513381;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fibExNx3GiA/92TUygQyn1q09jl45LUKbgRtFxXvShU=;
	b=jn+plKJBqOLswiPSRrTWLctYK+08CpElZQDOpQK1SdsTrm8vbSZ57WwERGfuOTT/L/JhK0
	ObvOTtsTSnM02vNpHOrGARhT7YYX6mP9nbzuDx1VaZxiDcmj4CPlsLltxQrpJrYKDFL8+W
	7zNoTEsWjyIa0N5tJpUWGso5WdP+fy+ZESV3gxdCr3+ESKi0QXI+M/KKwaQxz/gPTkz2Xc
	E4AUJkoNOfQpcgEbnctCOEpuP3kTF+ODaItSIquzNFRFPxCGks7R9Ked+zlu2/fohwoB3K
	yo57MD7V2Nr5ZXZ/VS5Q49j3WeNyx+JoekgF6+OW2r4zf/2QYfqamHbMombaSg==
Message-ID: <a5bab69f-22db-46f4-a039-cc20fe428abf@nabladev.com>
Date: Fri, 31 Jul 2026 17:56:19 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
 imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-7-marex@nabladev.com>
 <20260729221033.3CDB41F000E9@smtp.kernel.org> <amtq-Ukw_dyvavxJ@SMW015318>
 <e4f9ef42-d752-4563-a86b-4c62f47e43ac@nabladev.com>
 <amy96HmlzdtBz4nl@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amy96HmlzdtBz4nl@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/31/26 5:23 PM, Frank Li wrote:

Hello Frank,

>>> at imx8mm.dts, 30050000 is SAI5, here you change to to use clock-controller
>>>
>>> Suppose address here is wrong.
>> This is correct and we already discussed this in V4, the SAI here is not
>> used as an audio controller (not using sound/soc/fsl/fsl_sai.c driver), but
>> as a clock controller (yes using drivers/clk/clk-fsl-sai.c driver), the
>> bindings differ, hence this node.
> 
> Thanks, I forget it. Now, may not allow this method. The same hardware
> have to use one compatible string.
This was already discussed at length when the drivers/clk/clk-fsl-sai.c 
was upstreamed, it is clear the two drivers are not ideal. The rationale 
for having two separate drivers, one for SAI as audio device and one for 
SAI as clock controller, with separate compatible strings, is to make 
sound/soc/fsl/fsl_sai.c maintainable. The sound/soc/fsl/fsl_sai.c is 
already complex enough and folding a clock driver into it would make it 
difficult to maintain, hence the separate clock driver.
