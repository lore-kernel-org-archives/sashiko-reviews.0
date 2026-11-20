Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178115;
	b=LLYrM7hyUrZt2Jc9f4zSObo/z4R5cl1IiIrAzGuOF9Y0WMA2SrMthx2blSzGOXCAg2PR
	 XGsIVh1a9XxskwK98I8SHq8G2wQ3i+dP+q7ApZXQDmH97sge3xv4yd3mP2tuRBlUZpuRL
	 bTGBR8PNv486PCO1DKN/o34xJpUkLa3/y4Mlhbo6kvH84nF+ERPhS7HPZAAEuNCRGfFRc
	 ix4yeDSQR+4V861+ujDeg+a7oGCWc5fLKOSOtasK823atio+ZTGckPXHF45aW26blcZUU
	 FYIR+yFzNLRcXJ4Beo7zMnyvnMrPvatQgt29SubJuk9NtYFuxIyXYajHCDYjEneuWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
	b=bwFMG2xiQYHDA5XhQz0Fp8QoKCcD9yFLMRGOs92GXvb1bc3BosSJdvjmex0ax3n2VbA6
	 o7f+PwuJrdpN7Hpoa48zY7vYmmTYy8PkCyHJlg5RL2TihywT1ZA8ibphG5/xFFg2LTSnt
	 cMrQIdzCMOOeIJsCdtRbZ0A9G+6Ck57xQrzu/aoTpDD5/VeFjRH4RtC0P/eMNyuFsGtR9
	 uxY/mocdn7lZCecUD+jPm3bHgFsXnEDr8zhDcdlhgfGEJWB4Nl/u9Q2/u44JchrHkgeGH
	 /NyjXK1nUqO/2Sajq7VekS65bXjz1FEsX0QCU+BkhJN7/x5GsmrWR2dAqPcEFNTS+DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQ4gEi8F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K5h/M02N";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB2606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FB2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQ4gEi8F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K5h/M02N
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqq31681893
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=; b=HQ4gEi8FRZlbmoyx
	hcFr+Dv6HlcDFzaK6V+8VR+n1LBPEJPSINGyXhsRyjpuJmsn8xbox2xYAHPRn3xf
	QbE/OtkSWO7xwJWLKRwy/8VPSSKEc469Gs3ZBwzKtroSb896RiQ6Ab6Z9M1KZa2W
	lPetadYyO7Rnjrp9msTNhnU0e1mQb6ZlOQS4a4F9yUIU1e26Qn+ZOrew51su5bkL
	7qbc0hYOGR0OUGBoGQkZoFB08d8QANQGS2NqvCYBHH2CwHbwgjhLqT/tNSogjs9p
	4xeP7MpjISousbiS/gHOcLjF2lYavGUWDNzDB12DWRzYYzR+kUwBxEzlfJRF3IcT
	LGh3KQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tg6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:35:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so1292020eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 04:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178113; x=1795782913; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
        b=K5h/M02NOvGmQeoQwpVd/ToCVWchbmi5bN915x6fosxAbuXFtswv/bKx3seFiimfQZ
         BchBSVOmJJRiAIRx+fyV0gQPhR913dpeMIrILdEkd+ioo9YC0s+nXKkBLcba1jsbXsb6
         PoM/88PcnIBiKEKpHDbS4YJh62MydeYtms1K71BGUSU4oCtEy93tfzsDfizBlZCz4yWC
         bsXNhJhz17sdOq5XE4jCQVDvHaW/eSO+MNuFi87sQ+Y6PZ6J/TXVyWML4Jx9Btf8oVuo
         950EmLoOdwFg6ORRu0j4LYQYC01uGc+nuRgoe1fUv1Uc1nc/5ojDoFRBMUjqza1LWtSj
         hR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178113; x=1795782913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xedkqmjk2olSr8rF4krrKPa8xLFWwwWvaPjFM3UJPeE=;
        b=Co7aGlBqBqdwt/2cH0mHc1MilSk/t+T58WCbuwxF/2nMrEehJ6FmYbCr9mvIzd8VDx
         JW695Q3tQhkt3In15F+ZW2OTOwfmJ2hhyGr+OW3ik+y7mXuww+XTLVOvyr2j2+p/mksH
         QWHdHzs+DO9bCA/4odRnS64fayU0wLDye5dtPz7ILZ9/mY9yCVP9LdtFomI+AB3MZjXe
         my7GCa+BwWrvmlxMYI9qPS84+2bzQmOKnnzkvALTODU8x6+h6omdj1O4HVj9Itl9TD9d
         CSUVeEaOIJJj2NFeiZETlxr8aKmnav3zBIXgtQUq+QutI5fWafb4un/f2j9c6pHjdwE1
         5DDw==
X-Gm-Message-State: APuU4Z+d7iZxuHLrFN0CG4UdOWrlynqKqzyFN2gxFpFxbNM7tHNlsVF4
	G9UPydt7zqVgkeTuvZGCVITL3PlmvUvlRtTGnFlpdG7XORLDL+pzsrIK3xnw3UYYb3N9kj4YG49
	W3v5Zk3BQWAjTAn3nfX9VlFUxkk5/fjNv2blaa58YRtFq09Qw8iDdneFEHWP7ak7BwREV5sxzdt
	w+ncc=
X-Gm-Gg: AZFdTZfXp4aIQ0KMH3cIoQ4hL5Y7r4wMvMlWwW8oub1MQCchrcDvx/2S2VSPSBm42MZ
	pw3dDZS8NTKhOAPhtFaWMXVmyeQ5FrNHjTd3ZpDj1kWQXZr3tQ3Q6/OFrsMvegGRZP8m+bY0uVY
	fL8fFFrNH6YXV420LzlMyL6ysBjPWaIW7XE9VL8FXegtnrUwI3v3QVtMV2wXiRdntv62RFymPyI
	dnKACfenX8uakf2VVnmouOz2hEaBS7dGXrrhdmCjGhka37TVY2jMgaO8GBbf06P+nBVYlEWDRdV
	VZbHmnv1tCaIoSuDN/1vId2+Xpwh0MNLAQrTGI8NMXPYT1rCmpaXeeidlXFkDIlnbHW9j8Gsdc7
	pnfd42rGtCH3TpItlzwSxIcvrmzU1Q2jR5fH76sTrx+FG6eLe8TIbLuYYo+j2zoiAQLEbLBZ2UD
	sX
X-Received: by 2002:a05:7301:4606:b0:380:d1bd:ed2c with SMTP id 5a478bee46e88-3856f54aecbmr2594213eec.27.1795178113322;
        Fri, 20 Nov 2026 04:35:13 -0800 (PST)
X-Received: by 2002:a05:7301:4606:b0:380:d1bd:ed2c with SMTP id 5a478bee46e88-3856f54aecbmr2594181eec.27.1795178112439;
        Fri, 20 Nov 2026 04:35:12 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm10442441eec.4.2026.11.20.04.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:35:12 -0800 (PST)
Message-ID: <f2fd76d7-c66b-4def-8a63-91d4a3c7618f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:05:09 +0530
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
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
 <sashiko-outbox-223069@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223069@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b003e82 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A4kCXxDk9FfMGSrLdMwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: sVP9G0H850jSSStHmP7AHzBBhrkN8ogg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX3ZlLsp318KX+
 wgH7eWYTO8Elkk80lNWhIcYCl6Mq4O4GSuvImUQDAJV/Zywn4qrAvoMJtIVfyTs5yEdAXrIJ8BQ
 FfdJYVHJmzjIM4YgD966pfNujSyK6/RtAis6zlcQ1/JVWv+0BAZFAatNF7Bd5MNgjxkbG6wkTyD
 kq+iMbQqU6qsarCCf5s0PGJcZPczWXzJQzSd+WO1INKfwglLnKMjus6iLEgySQM8n0w/6N3HbI2
 lRmboanIofllJ/8HHlIr04/2rh//UoVKtEYe8xAjDdAUA10Fm/WV+FsI3Oq7UyUFI0i2d2cBXdx
 Q6Pe37N6407WisIqOj6jigV/Yj2RvUMRwD4XQo3bcdsjMVfJrGyJuF9hrJJU28e95M/owH+ucX9
 27AhUIQ/03Y/VEfy9DRgb2lgjXi9eVxxpvon/ei47rpmKmG2qGmFZX5wDmynYP/sSqBAVDsnm5t
 /NYNa53xGgBzGel+XZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX/iDXvaH7gSSA
 0yEIUOKoSWAc/k+5h+PWE/wL9T+QRd6110ZEZfgXEYBTmWwY6RDAsKHptcrAPsVtYQhUxu6vMem
 TVuNo+f1vN/1pg3ZLqbR1+hBxmcaNmI=
X-Proofpoint-ORIG-GUID: sVP9G0H850jSSStHmP7AHzBBhrkN8ogg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200049

On 11/19/2026 5:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: shikra-el2: q6apmdai iommus fails
>    q6apm_dai_probe()
> --
>
> commit 0d5069de0241cf74b87f4a2a71c79f4b11c8da67
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
> This commit adds an EL2 DeviceTree overlay for Shikra boards to describe
> IOMMU stream mappings for remoteproc firmware and applies it to the Shikra
> EVK DTB targets.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> new file mode 100644
>> index 0000000000000..89997ed7699ee
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> @@ -0,0 +1,38 @@
> [ ... ]
>
>> +&q6apmdai {
>> +	/delete-property/ memory-region;
>> +	iommus = <&apps_smmu 0x01cc 0x3>;
>> +};
> [Severity: High]
> Does adding iommus to q6apmdai cause q6apm_dai_probe() to fail with
> -EINVAL on Shikra EL2 builds?
>
> In arch/arm64/boot/dts/qcom/shikra.dtsi, the ancestor gpr node sets
> qcom,domain = <GPR_DOMAIN_ID_MODEM>, and q6apm_dai_probe() rejects any
> iommus property when the GPR domain is GPR_DOMAIN_ID_MODEM:
>
> sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_probe() {
> 	...
> 	if (apm && apm->gdev &&
> 	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
> 		if (!qcom_scm_is_available())
> 			return -EPROBE_DEFER;
>
> 		if (pdata->sid >= 0) {
> 			dev_err(dev,
> 				"iommus and mDSP SCM path are mutually exclusive\n");
> 			return -EINVAL;
> 		}
> 	...
> }
>
> Because iommus sets pdata->sid to 0xc, the Q6APM front-end DAI driver will
> fail to probe and audio will not register in EL2.

Yes, this is valid. With iommus set on q6apmdai, pdata->sid becomes
0xc and q6apm_dai_probe() returns -EINVAL for the MODEM GPR domain, so
audio would not register on EL2 builds.

To address this, another series has been submitted [1]. To avoid a 
dependency on it, I will dropp q6apmdai node from shikra-el2.dtso in 
next version.
Will add it back once that series is settled.

[1] 
https://lore.kernel.org/all/20261119164705.1594066-5-mohit.sharma@oss.qualcomm.com/

Thanks
Komal


