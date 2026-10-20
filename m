Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.183.30.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460270;
	b=HT7/pfeEroAYTWTkNz0cAYTNvMjPXD2NQzN6LRMxMy9X93I2nHKnDcSvTpVLjM5sibQr
	 xYzGeF2MIfWOkwIkmodhXz2R6+OKRya3C6AyNa2W/eTlUwY0JDDI0BqPnvX9CTL0XBY2z
	 rYnqyFZfIifBS/mv5CsC0t4RvGDBMoIZVzpHjS/du01iXo6fwRM3wYRbTMnLZPNLkw7CN
	 6wdvUhTRqMfEjsQQDLJO88NWI1ozIa3q/MSIxeC4lBm6Oelg3m2MEPpa69DS96CLU4kO/
	 G0kXqxJh1pgk/fWWWX7suqaBT7Jw/GBv/Ej/9t6D5abZ6s6JY+k0B9IwzSdxxr1kBsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Sony-BusinessRelay-GUID:
	 X-Proofpoint-Virus-Version:X-Sony-EdgeRelay-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Sony-Outbound-GUID:
	 X-Proofpoint-Virus-Version;
	bh=5Wlhf+2RdwZwj9+OlXjfXJb1V6sCsvah1rFK3bKNefg=;
	b=ksYoWKKfbUSYtTWjHHzOWNVt/qDlDvuaU67Q0UxfNKr5ny+ly+xYHFh/9dUiqc//74jv
	 G9F2LFYIUOyKUGXVC2gw1rFewUM5QkCemfQAYkRpK6rB5rtw2Dq/PRBY+WtZWABsbv5Q5
	 uuBPccwFS3grd6U8RVLwPlcIq19sOaHnWu2k2BKUA16dBYvvQfyXTjy4jP8paSeyjSlUt
	 vspncJ0xF/lr0y/a1lfkwtVVgM6NozCsOe2KmHohyLjwapK5Eo0ah2TbGjjtcOL4EoR5K
	 2gDgXpApDQhfWEZmqujIOWQha+wozn1x+dzugIxQ6Kz7T+jIsXECKhNLBXqrDXaV1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=iuh+m4C7;
	arc=none smtp.remote-ip=185.183.30.70
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99074606A319;
	Tue, 20 Oct 2026 01:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99074606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=iuh+m4C7
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0uE7M3979141;
	Tue, 20 Oct 2026 01:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=5Wlhf+2
	RdwZwj9+OlXjfXJb1V6sCsvah1rFK3bKNefg=; b=iuh+m4C7zlVgQ03Clz1Yogp
	I4NnyMgpgj5tZUdXsQqO4yAdN8ZsABeLH/ZSnXtZPwMfEZciqGNFBi4GyGeuKbGh
	+XlYtZ6xQM9g4/t/V2aMuydARxlodWirFjydpYwrRX8LwuJ6LV5e42085eo/kh0T
	ULqlen4LwKZde6VboNxOu7zv0t0Zj58IRq+jWsrv9hzyhDrQLc3HVr6wmJIlkHGB
	CK5YqhUHvI5AcXvN+XHvwTZRgE0ocDYuxxHvI2o3ANgaI1+uHSeB/JN9XU0O9Qi8
	Z/Q3LQ0h1gjeloZfKkxfZ+v2/0ttTnf2NPJdcqlrFD9nlN43i2Do3W1Tz22qTAA=
	=
Received: from usculxsnt03v.am.sony.com ([160.33.194.235])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hdw4x03w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 20 Oct 2026 01:37:27 +0000 (GMT)
Received: from pps.filterd (usculxsnt03v.am.sony.com [127.0.0.1])
	by usculxsnt03v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0sHmu4156036;
	Mon, 19 Oct 2026 18:37:26 -0700
Received: from sgppsba01v.s.gdce.sony.com.sg ([146.215.113.218])
	by usculxsnt03v.am.sony.com (PPS) with ESMTPS id 4hctk844rw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from pps.filterd (SGPPSBA01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA01v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69K0tLQW990024;
	Tue, 20 Oct 2026 01:37:23 GMT
Received: from [43.21.135.184] ([146.215.113.251])
	by SGPPSBA01v.s.gdce.sony.com.sg (PPS) with ESMTPS id 4hc4gg1tjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Tue, 20 Oct 2026 01:37:23 +0000 (GMT)
Message-ID: <a63dfe3d-9178-43a6-a9fb-ae82c86a047a@sony.com>
Date: Tue, 20 Oct 2026 10:37:22 +0900
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
Subject: Re: [PATCH v5 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
To: Conor Dooley <conor@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-2-lachlan.michael@sony.com>
 <sashiko-outbox-176511@kernel.org> <20261019-cause-decline-feb5a68f0d06@spud>
Content-Language: en-US
From: Lachlan Michael <Lachlan.Michael@sony.com>
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <20261019-cause-decline-feb5a68f0d06@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Sony-BusinessRelay-GUID: 9_K4QSbeUaHoBWPa5lZ4Jq4isaSR7w-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: Le1Dns-u0jodrHXVoQRr0RB86GejOWod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwNSBTYWx0ZWRfX4t1WMl6mqfmf
 yeCyNGH6ZGFbcRodi/um2Yim3EFeprqyFy5nH8EcGJUcqk8EYUpjICSodhwnN93NxUUtoahOsX/
 cab81mFcxODEPMvEX2XzEb6lTpUW8zKAmUSaQpoqz0zXLDPCGIGo
X-Authority-Analysis: v=2.4 cv=Vbdir1p9 c=1 sm=1 tr=0 ts=6ad6c5d7 cx=c_pps
 a=Ycsf2/9e4zkPkE23zi987Q==:117 a=Ycsf2/9e4zkPkE23zi987Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=dNm3KQjjYUbhztXjLiFs:22 a=c92rfblmAAAA:8
 a=z6gsHLkEAAAA:8 a=VwQbUJbxAAAA:8 a=ALUUi9MSbu_VYicB2QEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: PrJmEJ2YR6oA-aNLmOv79CT9K6g4PpMf
X-Proofpoint-ORIG-GUID: PrJmEJ2YR6oA-aNLmOv79CT9K6g4PpMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwNSBTYWx0ZWRfX0J4F6Xfw8rk6
 vUuS5Ymq8fl5xemFtpunr9P0REIKR2eAd+rDDlUw40FBa+a5rWF7ryya9y8jR7ZNqXGYNv5ruIM
 ktKwtCyGXqiKNtsdGrWzjUbYuIHKPJ6OMCO+KW/Od2QVSxcj0sxbtm1SG3DgiNF4cZkesJPKXLU
 rALb4ap156HwmZhFjK4Q4ficVAXlOhq5CJCgneZv6IvXE0dV6cewP+0iuwQDbAA3XGvxfC6d+H1
 5WuWiNSohYWY2fvkRt/5hTi/+Y+Id8qi7s6pdAn+k3QBUeECwSbIG76zhHnC7W+ArLf0kSS28t8
 ktk6J3ICiUwjhV3UtlVsp2/zZtq8CPytpjqO7dHb0QOB8rdDvTEIzhabx7JEINqVBOcS6N12Z5m
 REAjUcxjcTdbZOEVL9mxGe9rb0EAVMX+7lWiP3sYlVBht16SghLVRZJqGzpEK7SoKUCN/XAcE99
 ZKT5WEJ1pS0IqiYcWWw==
X-Sony-Outbound-GUID: PrJmEJ2YR6oA-aNLmOv79CT9K6g4PpMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01

On 10/20/2026 3:21 AM, Conor Dooley wrote:
> On Mon, Oct 19, 2026 at 01:53:48AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] dt-bindings: media: imx908: additionalProperties: false blocks allOf schema
>> --
>>
>> commit ff8a8181af73cacaf3f8a03e0acde33eb53bb18b
>> Author: Lachlan Michael <lachlan.michael@sony.com>
>>
>> media: dt-bindings: imx908: Add Sony IMX908 sensor
>>
>> This commit adds device tree bindings and a MAINTAINERS entry for the Sony
>> IMX908 8.39 megapixel MIPI CSI-2 CMOS image sensor.
>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
>>> new file mode 100644
>>> index 0000000000000..828db1175e2f5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
>>> @@ -0,0 +1,108 @@
>> [ ... ]
>>> +allOf:
>>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: sony,imx908
>> [ ... ]
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - dvdd-supply
>>> +  - ovdd-supply
>>> +  - avdd-supply
>>> +  - port
>>> +
>>> +additionalProperties: false
>>
>> [Severity: Medium]
>> Should this be unevaluatedProperties: false instead of
>> additionalProperties: false?
> 
> Only if the properties outside of what's already explicitly used in the
> binding are possible.

IMX908 modules (i.e. IMX908 image sensor + board, made by various 
companies) could specify rotation, orientation etc. so I think the 
comment is valid.

I'll change as suggested:

-additionalProperties: false
+unevaluatedProperties: false

>> Because the schema references /schemas/media/video-interface-devices.yaml#
>> in allOf without listing common properties such as rotation, orientation,
>> lens-focus, or flash-leds under the local properties block, using
>> additionalProperties: false will cause dtbs_check to reject any
>> sony,imx908 node that uses those inherited properties.
>>
>> [ ... ]
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261019014720.2635-1-lachlan.michael@sony.com?part=1

