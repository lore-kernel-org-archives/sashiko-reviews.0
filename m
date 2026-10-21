Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584246;
	b=QeYOvWzFhwiMfbdS6tDBdc119v8CEwyKVxLsRbYmTFYW/27Ng7XbOPMnIEdwroef4WvC
	 kWO/m17Mg28zkkG2I83pcg21vVhb04avwdPtMFiGR8Wkyw/KMVvVd293od92IeLdKaPM9
	 mFbF90hbnXYNO8QlCULEewng7Bwm9ABZCMcHclCBkFMkseffBVHZliq9vK+JAdad+2hKS
	 RzTS5UlCbluOi3BNdmbvbyU7JE9f22RxrpYdbw1BQnkOV5DtF1k8oAhO5BqfKQkuEJ5zK
	 rQHFlijoqR78wUb9Ama0ThC16duZV+beIVKfYOK1b8oL2mx0E4cvnb6tqpdmY0YTvaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
	b=qc+XCuBiv8aTblr/ddMDYgniTRwuKRFC1ImhRrcYo1aDFymThcTDxwa5eJ8dqnzTK4gI
	 oB1YXfSkoTMYXdlKBCxxsJL60/EnGhESHtZY5G19mhNoFRLRWWUTGm8JvhZssJYEQCHBd
	 flsMo9ycrDMLnXiijCTl2RFPxUZ1+oqqqt1dgdvqQrKCH9Amb2uHQxUFBmPrqbtImqCDQ
	 Y6WhZql96yic8v4xqcGCYVnPAUgM8xjvm19mVxqtWmDt0nDN7WP6e3HQNx9W2etuhGpOE
	 1As32JEm+jrNcliv2VGhk43jgPXYvqc26nuxkpUsMuuAyMLynvJI/LeldXkImMaPFUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byJITNCR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcptZPDz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ABE606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ABE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byJITNCR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcptZPDz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgZwT4168337
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=; b=byJITNCR1lDDSNII
	70AynwwagMDUqWmWDlVM9q8P4d7qU4i8KI9jo3twlfP8ZOUl2KL3T1NxMRp68tuD
	lo1btB4YsjKBfFEnWTdtshB5f/3BQOxRLkdx+8Sd2hle8v1ylo5A5SYyVuxW22ss
	DJiSyqhjv8BECLsihRFUA75aRtqWUzHpFBKCM5QPOMh80DeswdHklXlA+QWXjiPH
	7Q+m88+Orc7rzW01rQbJK2rPGLeKPr1zZPPuWa/r69cuY2xuCO3YY5KYP26PsERI
	xu2HFPgzbhv5iM7TF4Q5ilLdjWmgivWb4lJRszV1RfA4AR+UPrzpTRWZkoOtTAzA
	eDjw4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0krxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:04:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so976612eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584242; x=1793189042; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
        b=UcptZPDzyiM8vM/bQfA5PHHneX4HpneXcKRm7xqj+S5+Vlzf10k+uNriOnbhtQqDoQ
         62f59ORUhLyfmB9pg2P24TZVYXGWDg1umzbhy9ZZrEyx9/oF3C/UlsbOLHRAJZ7FVzTm
         nbehyYBDCqoQ1ZfqvCMOGdIV9Pwp5Hgi/ZTK7pwyZsKs+cFDbYj7ApQ0wN29BucPOhqq
         0smcKWeDxteFe6Dt273FEDOQlEj+xp0kI1C8boONuQZxan5TvgoedeXev7hPFpswGnLg
         CWUFL9EtaJU3anlSh5iWd7wMYitSJEPV5FLn3jKyvnxoDau4TP35F0/G6W0bjUReGTrv
         sQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584242; x=1793189042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
        b=e5fIvh4LiXtHuU8OWy0/dOH8FtesY/JAbBb+vf12+bFSccEzcIlTH4oVNtthOEhLda
         OzPTM3RLOGxSBC/MO1KlPLpWuJyJutzr2WeoToLZ68B49YULgvt6X369emUymxyWyiMt
         CWoGM6r9kNfC6iJ7XNp9LXgMDNVw1xjSf6icAeYHi+Y8pPGOw0h7/YujHgSl+eQmjIK5
         FUhN5qAXYUVUIseVlPJcESh5RUklIvt8EJyTKOvw0atzm93O2daKyDMULCqYpb9uRgiR
         yWbvRTbJZ1uiGl0PQZJd3z+d0HtEDWVlZPPq049g/YMcC+RAxFzR0YAocQnFdQU1MGAY
         HZYw==
X-Gm-Message-State: AFq9FYLfVb3wH2Y7VLwtOYw/rXmt5hP4I6BvuOtptWcvYYJxKDRnCRmP
	LwOERANur6eZXwC7mv1gqFzYECUj3mpdPV0hCpAu58MzynN9g0q//4l/CYPCLuzx/i3JWU1++nZ
	LsLTKbNhIWC5BrhNObFG9z3ht1mc7QNaKbg9FpYaKl6XquXjRJgyJBtJGTdg8SxZMEAN8QwFeOM
	PazDI=
X-Gm-Gg: AYBFou0IZSlBP4Wr4Z6ddncjCgvDjFQ2qPvp21ZmetYTSASSgcuoqx5V9ZWInAVxPlk
	HP7ThJTki0/TW8rCEx464y3Z/ci6glUhQmtHTZIvfSDvur721od8iOY7Qa97pu3HJJQ199sHw81
	VB4V+RqX0NcSIvR6fe67idoqU4VkrYd6tsVA8oyIQ3HNQM5A1Ga4EwLu0c12eD8SNSCmKEFrvb1
	V3O5SCYLwSaNaPkXjtvnZy3Jvusc0cRsXhNCSiATmh6mILySYfUjccjK5uyiyv8JVLNZzjR8ZZr
	FLwQL9Bpt8yGCWQjD7T2gkXMuQNNW/UK38d095vQnXVCH02YnB7cXjZYOHY17PwqdW++v21vZWX
	jm8hFAnsL336ogQTsMA3MsScICwk8dcRgpg==
X-Received: by 2002:a05:7301:2514:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3674b53165bmr3172153eec.1.1792584241787;
        Wed, 21 Oct 2026 05:04:01 -0700 (PDT)
X-Received: by 2002:a05:7301:2514:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3674b53165bmr3172112eec.1.1792584240944;
        Wed, 21 Oct 2026 05:04:00 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm14718312eec.26.2026.10.21.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:04:00 -0700 (PDT)
Message-ID: <d4d8a3f1-b1df-4486-b79d-e8d406c91e69@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:33:56 +0530
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt
 to LLCC node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
 <sashiko-outbox-171515@kernel.org>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171515@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX9bs42fPB5D3K
 vxPb1QTZaIBeW+WBHHgs9Gsq/XsttQz6X30GwlItlN4Z/yXL0LNzavEPGoy2iJp1OH3XwYNRdah
 5orUib0dC2IUuheB8JyzgIoe7Zg3lMvGEPs5lbBQPbwQisgyz+bqTrOqD41qS0iNTxdp8teTwHc
 BhuNwJnP5wRgsnFm73aqKsA/LpWXn+8U3L+XFCT/sMDTb8AWMW3tsptyDOU47cICJXqjjgpnDv1
 UOpvY3n3q7Rf2jYKMIRj9iGvZiJwp/VqwwAIlbX9z9j3cWKaTJ0kR6Dl4LAPR1gghTe4+9HRval
 mjqUvirs+MuBWqXuOTJRaP77wsioRh7VSi2xZoukneC7xTGxoNhUMvxRyhq1k+y5bmjeMz9rUx+
 BucezaJauoi+un8QoAlgjFh2j1gcMOI8UNuEx3Mhn765R65vfo4qo73/XNY4iO98vIVPaSn/RNL
 /WS7SogPb9P4RUNS46A==
X-Proofpoint-ORIG-GUID: DvqHG4eK0pK2b6FmZZtAryVjvhKUAAzz
X-Proofpoint-GUID: DvqHG4eK0pK2b6FmZZtAryVjvhKUAAzz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX/gfPFhkvG8G4
 4/9m6KhHGS1XXS77dPg4MRGgtwf6E7SfFP5UV8PZtlUG1vhz0tytQKeNyCcsobkm+FMSJ/2wDe/
 F2jSDst/n0SqvlZRu2fGEQQczZOau6M=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8aa32 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P47hWFwCXEHhMTGuvmUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210047



On 14-10-2026 21:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] edac: qcom: UAF in IRQ handlers due to asymmetrical devm vs manual teardown
This is a DTS-only patch; the driver concern is addressed in the
response to Patch 3.

The identical race exists for the pre-existing ecc_irq INT path which
also uses devm_request_irq() with edev_ctl as dev_id. Fixing only
lcp_irq would create an asymmetry. The correct fix is to convert both
IRQs to non-devm with explicit free_irq() before
edac_device_free_ctl_info() in qcom_llcc_edac_remove() — that is a
pre-existing driver-wide cleanup not introduced by this series.

> --
> 
> commit fab541f0482e82717fee45392a6aa89253bbeef9
> Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node
> 
> Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
> interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
> as required by the updated DT binding.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 2623e139196f6..ff572c003b396 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
>>  			reg-names = "llcc0_base",
>>  				    "llcc1_base",
>>  				    "llcc_broadcast_base";
>> -			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
>> +				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
> 
> [Severity: High]
> Does adding this new interrupt expose a use-after-free race condition in the
> EDAC driver?
> 
> In drivers/edac/qcom_edac.c, devm-managed IRQs remain active until the devres
> phase, but edac_device_free_ctl_info() manually frees the payload object:
> 
> drivers/edac/qcom_edac.c:qcom_llcc_edac_remove() {
> 	...
> 	edac_device_free_ctl_info(edev_ctl);
> 	...
> }
> 
> If the newly enabled lcp_irq or the ecc_irq fires during module removal
> (after qcom_llcc_edac_remove() frees edev_ctl but before devres deregisters
> the IRQs), can the interrupt handler dereference the freed edev_ctl?
> 
> drivers/edac/qcom_edac.c:llcc_lcp_ecc_irq_handler() {
> 	...
> 	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
> 	...
> }
> 
> This could lead to invalid memory accesses, unpredictable behavior,
> or a kernel panic.
> 
> The same race seems to exist on the probe error path if
> edac_device_add_device() fails, leaving the IRQ active until the function
> returns:
> 
> drivers/edac/qcom_edac.c:qcom_llcc_edac_probe() {
> 	...
> 	rc = edac_device_add_device(edev_ctl);
> 	if (rc) {
> 		edac_device_free_ctl_info(edev_ctl);
> 		return rc;
> 	}
> 	...
> }
> 
>>  		};
>>  
>>  		gcc: clock-controller@1400000 {
> 

Thanks & regards,
Mohammed Faiyaz
