Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275052;
	b=DbmbZ/yuuVnmv9Phf923FyIxPO8S1bs+PsDFosOBMMbrfz/FOu/F7N1KAA2aLsHLyLUR
	 vGEpvkXMVEpJi/iWvcchjcpjiJOl1Rw3ZzRfFmvq3wfGGHhhxopo27WwVU6A//FJ0syEE
	 GKzVFDX23tJRl6B2jywRubHRPAuW3FFz74Pv0ZRJPaWgTB+/IS+H0bW1lqs5xRCv6qs7x
	 ktgSaFLQOmbR2MdyZf1Y/poSGxjnyUBwoYYCVI/PQldy3wiVUYXznwgog5x8fGz7/tz+k
	 5av420hbF38o3AMudGhBuLoYm9L6vIhs71pJBi+xl3bUkwzYyhS/Au5Gh+dIfMQmp/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
	b=DPRuHbMTykbMIYi16eMnkVqdArGEA6hd8LD7+eNVSmtrVOThqSSSSy2oeGNbeXHawYQ9
	 CqwWgWAopmz1HNiotPmffTxGCTf6uKuMpwRVKMhCJ/7juslikmNAknKTG5ZG/pg0PFtht
	 ABuNtfvrjbCoCxjOg8Wo1SfabmKKqwXaBlHA+gkjubp1v2rbzpfOFbhAiCX/RWcK0ufzo
	 TZw4R9DcZ40PA5le9BCWtPJy0UtJ7GBba7aIWvKL1J/U/VRv2ErEMjBzO3/s6hpnEFnh1
	 12sayrDe5trmpq1/ST8Q5QJDPws2yekLPJUn6BP4vZTJFrA6hDkub4dq7YC6YhHMU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxDCDgSp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtyPeM3J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F7606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 11:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 225F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxDCDgSp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtyPeM3J
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vuDn3279843
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 11:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=; b=hxDCDgSpdqTC37gI
	bNJOqlq9LiLUaQSYCfEFwS0tIxx2QY7UNOEiWgxH+TxvS5mjCDfdI37sBgeBijPb
	M6bgzcS6s72WolElyQ2vgNNcohJGbWcxjESXclKAWsTo2Lad/ie+W1w9RFAXf1am
	CrGqN7muw0IhiBgZLLw3FG8EI3A9B5shRRGFVw8v32rmDFu0K+8Q307VvgdetElE
	lSQI1r3IMLANdwIXrfPhvgINV5Wbu4SrM9W+iqfPBErUNSLtpFREgoOiD4sriuvZ
	RyM72ySDXQh9u42hcStgzoOLxJwZSH6Y3T7oj9oIQfQuZD2/YtykMmvhkHJ/xB0p
	AfR9cA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3naud2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 11:57:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4402301eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793275049; x=1793879849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
        b=AtyPeM3J+f+3RTRLRDktU9J8oJXU5Z5N+0hbNiSabnNDeH9OeKhLKbEFoq/BtIQSAs
         A5bm+du2y3wEoWpXt01no5zksHTyi2hSCT/hvTTTsi0RN1End8cmYXx4oRHlzYkWqJ2B
         bpaJC08iW9E/lw+k3b8Q36wSSMPsHiKfg1ACgTbAYrk/u1U1uDDM30Z1j48pus6vHJoK
         RA8VKdbp7S3Ue3f6Mi4nej0pa+PaQ0IXjWzjAN2X9gJbCTozq7T4pw56d2p30oRV7uX+
         ogmUNG0zezNiURAwpIEtYaOAkzoG7JCSPo7amd6EVSCxmNX6VCtgy25uZb70DhUjVGA7
         njGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275049; x=1793879849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bnrTnt4lBgnv1x+jXbSvL9pJ3rMP3v/MI1jVoiwz0s=;
        b=Mm9EGTuimY8ZmrWJqg38O7XWHdXwloT2t2n7DiYHsTXeii9r3PVrrVPiXwU813Mvn2
         P2+v2jGaW675OOvcaPu7HW0L/sZaRuLTRmlMVOQxH65QJKT+Gb5jELfKlUcmp2W578xH
         Lx94Ux+ekawDF93uCqL1U0wRi+b22/VnoQ/bNvwnS9NwOhFQzngO/Fs7huxcAJfWPpJP
         Mn6ZMeNqFU/oBPtFz68ew4OPNWaCZGyCFvWTl4l6J8vdS9ZJCtwSiu8U0gRKmMv6VmXj
         l1Xyif98fZXwfivy8r2ZwM96phNTQx3JzzXLK4xV4QXcRc7Qf8vBuP6tOn5BkRMPnoZO
         jB8w==
X-Gm-Message-State: AFq9FYKoywvuXkH9QxDryULdC1+05pcizrY+8/HGv+8tvvxdw2l2iCsQ
	5hPJCJ9UJpnpny45upeksbyTWAyMKLeFj7WZqKNt9gjGZfJ/jpoNE8aizcwHZqP637lpVkGezNA
	l6HWTamT6bBmJxIioamt/vtB3c1linkzY4XVaMh4wNtvT79a5jy3H+ylDVmrbwrHmB960uasqeY
	Tbgcc=
X-Gm-Gg: AYBFou0CmgMLowfHSJQGEdKS/dzsAMGUUYjoG3HNa6GO2qJtPA/fmZf31giUitfz9VA
	66E70SNdB944VUr4G7paUxOl00qTH5DvykVaUHoLJZABV4B545WsKQHIYZqhc9W0yYtF4yai+DV
	i44eM3CRnkP0GAlAbtvB32+ptgQmsKAEO+h2rgVD1U3Dg8MyYhjOuE5Qqu1klYRwydHNaxHG/wX
	DBFnGeQ1FEun2NnqebTEVZAcU0XE8/D15OVJow8FGn3v6YO3Ay/7lHhpExypC1kUkeHu/m4H6Wa
	9DAze+VTGAK2nXzjjY4mozB3t1sV/6w4ljq0JC+S2cBnkQX9gzh3+pFFlRRd9M41ftfeVZzq2F2
	jFE15lhkBsRZjv7TLuiVWnBCyOhokD9ywjufI+/d0IHHHtKcLtjKmkHieUusoMtwQmzmtKpFP36
	UoTVbu+TKojSoSDIGvONVVDaIfNa5J7Um28IQAUz0KHBu7Gulabsjw3vtrg36S9WbV8i/4gLxnL
	RA=
X-Received: by 2002:a05:693c:2510:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a203d426amr7045677eec.22.1793275049254;
        Thu, 29 Oct 2026 04:57:29 -0700 (PDT)
X-Received: by 2002:a05:693c:2510:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a203d426amr7045650eec.22.1793275048596;
        Thu, 29 Oct 2026 04:57:28 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm21157004eec.20.2026.10.29.04.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:57:28 -0700 (PDT)
Message-ID: <8ed020cc-7d82-466c-8f99-e25f52ef34b2@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:27:25 +0530
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
 <sashiko-outbox-186232@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-186232@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vhCxbraWLKBU4-vRKoGTrm3NUsxbw2SI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NiBTYWx0ZWRfX5S5URN3spwxg
 EqAdxBruTLE/BtGZOpQQ1fEmFEoYQ2zm9LzZlEI3VLOusNx/3Rh6uQszAxiqcN/PYzI2NAc9Ugd
 NFITPFasTtBAPpFuxoxHWPxVTd6GHPOnsEq95XyiWLSsIpQTembzt8slxG3+bXypT24FahKsosx
 1LAhtUEEFXkiBChdIeVBD+PDjGJH14PxtI0MPNsQoW69PuICRWDKrBh1cvMgXgtVZK6x5YG3ZT+
 FnFAYveBPJGtCO9wIcc4XAIqaT+1PYz9nrCEPn74XJtOp3IfWgxHX/Fr9CDE5Le706fnJrVHQZq
 81zk1oR85voWeGONiv52bdTmNgHxEw9+mkoKR3dZ++RGqe4hyI9IOkbSxeAhHNy5axKJ1+W/lzk
 6rLZDFEwQa8OQJGvcRhlsTgUfiPq0tD0TXDFee4wGPCA95ejwd1Gp5nxLXdsT8TEJM6olNMu9Yv
 YkHxdzHWWZUoawc2lmw==
X-Proofpoint-GUID: vhCxbraWLKBU4-vRKoGTrm3NUsxbw2SI
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae334aa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eOIwicZ2piiRI3fgtboA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NiBTYWx0ZWRfX0Zx7iRx04ifq
 +jcmppjQ0v4CEKlxtsPA9pZSKz+kMdj64yJA1dIzNMVxnLdbUWLwObJjZXw4TzVRK+dGQQyEsER
 nUUoAFVd7lf0xT2l1w9RKS/NvT24dgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290046



On 10/27/2026 1:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] arm64: dts: qcom: SAM compatible mismatch breaks ssam_platform_hub_probe()
> - [Medium] arm64: dts: qcom: stdout-path points to Surface SAM EC UART on uart22
> - [Medium] arm64: dts: qcom: missing qcom,uefi-rtc-info property on pmk8850_rtc
> --
> 
> commit dc92104026c28877c07bc41ec0441b8b4cc8661a
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
> 
> This commit adds the device tree for the Microsoft Surface Laptop 13.8" 8th
> Edition based on the Qualcomm Mahua SoC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> new file mode 100644
>> index 0000000000000..9acba318ab52b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> @@ -0,0 +1,1176 @@
> 
> [ ... ]
> 
>> +/ {
>> +	model = "Microsoft Surface Laptop 8th Edition (13.8 inch)";
>> +	compatible = "microsoft,surface-laptop-8-13p8", "qcom,mahua";
> 
> [Severity: High]
> Will ssam_platform_hub_probe() fail to match this root compatible string?
> 
> When ssam_serial_hub_probe() probes the microsoft,surface-sam node on
> uart22, it registers surface_aggregator_platform_hub. In
> drivers/platform/surface/surface_aggregator_registry.c,
> ssam_platform_hub_probe() looks up the board's software_node group against
> ssam_platform_hub_of_match:
> 
> drivers/platform/surface/surface_aggregator_registry.c:
> static const struct of_device_id ssam_platform_hub_of_match[] = {
> 	...
> 	/* Surface Laptop 8th Edition (13.8") */
> 	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
> 	{ },
> };
> 
> [...]
> 
> Because ssam_platform_hub_of_match checks for
> microsoft,surface-laptop-8-13in while the root node here uses
> microsoft,surface-laptop-8-13p8, of_machine_get_match_data() returns NULL
> and ssam_platform_hub_probe() fails with -ENODEV, leaving the keyboard, fan,
> and platform profile unregistered.
> 

Thanks for the review.

The wrong SAM compatible in surface_aggregator_registry.c is fixed
separately here:
https://lore.kernel.org/all/20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com/

>> +
>> [...]
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> [Severity: Medium]
> Should stdout-path be omitted here since serial0 points to uart22?
> 
> In this device tree, uart21 (the debug UART) is disabled and uart22 is
> dedicated to the Surface Aggregator Module embedded controller at 4000000
> baud:
> 
> [...]
> 
> Setting stdout-path to serial0:115200n8 causes of_alias_scan() to resolve
> of_stdout to uart22 and directs any earlycon, bootloader, or userspace
> console consumer honoring /chosen/stdout-path to reconfigure uart22 to
> 115200 8N1 and write console output to the binary SAM EC link. Other
> Qualcomm-based Surface device trees omit stdout-path.
> 
> [ ... ]
> 

Right, uart22 is the SAM link, not a debug console. I'll drop 
stdout-path in v3, same as the other Surface DTs.

>> +&pmk8850_rtc {
>> +	qcom,no-alarm;
>> +};
> 
> [Severity: Medium]
> Is qcom,uefi-rtc-info missing from pmk8850_rtc?
> 
> [...]
> 
> Without qcom,uefi-rtc-info, rtc_dd->use_uefi remains false,
> pm8xxx_rtc_read_time() returns the unadjusted PMIC counter value, and
> pm8xxx_rtc_set_time() -> pm8xxx_rtc_update_offset() fails with -ENODEV.
> 

Agreed, I'll add qcom,uefi-rtc-info to pmk8850_rtc in v3 so the RTC
picks up the UEFI offset, like the other Glymur/Mahua laptops.


Thanks,
Gopikrishna
