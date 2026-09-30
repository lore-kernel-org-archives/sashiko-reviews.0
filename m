Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349764E77FD
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773302; cv=none; b=lWwPUHMESpJppmU3I0Ny5KKQ8M0WCATAKX3Gm/tTqGiGh8cN608VfDVN1anpZVrpzmf4rgktrUsEUrq7X/KJtbMkGjc8E1U3gxnVlXirgKYJtlQAPOCnX2477LlfkAs1ecsxUh1cTZi/lafJaFDR0mRjn6HMWDN+/T/wrNvSpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773302; c=relaxed/simple;
	bh=OgRnPYhG5RVwco5xDgzPiijMOeZA+SafNb32PTzmQ4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtpxN9kisBH5J52bOS6M8zTSTk4Seszs/v5SH8/S0ZI4gxLBifuIorFBn2VFsZm9JOpPN9EqzAN7LXRZT6zO0aSSePCFfoglsLiM/8GA4cP+oygyu8Jw4tsjOIVK/7KOyX9173AgHO1liUEVXAhJrBkJWJkE6mEzsjttQOC5acE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxAhCEIU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvpKZkfp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxAhCEIU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvpKZkfp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7cnS3547308
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=; b=pxAhCEIU4tZ8CeCj
	naQmxTO56CJPNfJj9QnATe0w09h3VhyaCC4SdQhnzIUSSdBppDFBSff3DD/zhGCW
	JpZqDB5xFc1T0D9cOnhjDIrLUzics3v+qFJx85RlZxhw2dcaQYB0UMTxuVGVJdze
	sI4d07vwVadMJBMe8r/rwL5g5f67FZwpE4uiTaH99fFXbKLfz3mIySBTVkS8Qc+U
	S3SSYh6kkRK9aolda720cqUrV7Exvi/+M4fPJl4utrJcxiVJEA4ymYGHxsKueUMC
	VBF89E6cQvpxPUV7ltyutk5Pvob8bxyhlAKLctknciYOhdH38jBBlbcSwX9j1k9i
	20269w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141p6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:01:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so2000300b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773293; x=1791378093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=;
        b=UvpKZkfpuU/K9dM8LVMxndbgTs5TB+4UsxNAqI9lFzWeyjWL12KZ9KGVvKHQ2XS2a3
         qvVfPG5ucjwI6aMWgacRTdX9bqNUfTdq9Zo1ujY2nPz7kXL9icrzkBKv05yncIBVK9/8
         n6Ff3ku+TZzMx3eeOGUZzI34xabWzyH9wMOGS8aHv6WqVcw8tx1y1Bzl/I8IcXo7FIkC
         wxFTl1GxE5Dp6KEZLzm8vT6tjm4+8WMNPpOmptLnVcVo4zAeGhNroUzuLeTyms2pbZc3
         cTA0Lbyr/NKU7P+N11Czajq114CYsu+0tZPAqEQ1TAB2+nAl3vvr5Xtbk576qw4lqJKj
         CZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773293; x=1791378093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xa8gtSG0/dUR0SZ2+eHMRd0fwFlz1L6atEy4yfMV/I=;
        b=X3C3zfCQrxXKpiEAqKOfUvtd3XhJnAVApkEnvU7ayG7wSPmH455WpSrXieka58shoX
         /B2MYt/3+PJ0Y13QZzCcZZ3Sut1gyiVWqdc5fr8uUhchJNFgDqUB/zo1t/ZYYhJbksI0
         bqlYvmaXZrtKLRSDVigMtYInnsqNhOmRrak76I9csea/SEAg9u/6NuReqbqSTfW1fATA
         oyyfmIt3u4VHBmJhgaLI2gqRvYMI/QqYPsrIT4L0ljKNm75xxjl0Hn37P3BI+ntlq7qA
         j6w6Smvy81cVW9/vrX2UeGxvPg7sIivucXmOhyIEdrpH0ecoOqnK0UafKojkDohOpwFU
         GCPQ==
X-Gm-Message-State: AFuF++lk7AQMIfT/7YVERGOUJDlEt8Dj30tBi2pmN/XmAZnivAdM/pmB
	23fa7iYULTfsjra8IzUI/nFulP09r6jau3r5ORKVB8+RD8xCvrrqW7lsK6W1zmXBCrCfy2BaxnU
	r3AvWDlRqSFWOclvkegOZarqzPLv9F3aWU0PEFIxv/O9Mlbp07gY5dNRjZlH0PhSxhDEF9+Cp2a
	YTL88=
X-Gm-Gg: AYBFou3wZFuBCtNSEd7s5DfZ/bA821XllTqzrLc+ja67MPiCEnaqXNBYAUD9hioRFXs
	Ygq2qiHajE6S3C77Si/Bq1S7MzmTHdkamZQGM0FKmSRg/ndT+Jte76/zXqSOL2yfVhxqcnGniCi
	RkYUkhqK4pWE6r4Pu2EzyXzdOmqyUssHtnwtkbMkz949ktCpqOb4PWY2bOcUl+Pr6/XsD015zxo
	XzRCl/YYkFcvg7ssHLeLh/oXOl6XFMBlAx4sHzgO9Y+hU9UZf2iAcENuevve5jW2WJro1Tyzjr4
	gaSHplXgg3i+3R7jAm0baqsEzEZ2nsvyv04LJL5n4MEun4QZ6X2AHuWy42nDFG7JXnEydwjaLj/
	dZfSi8mKvUENBPjBkWWCJGD8DSBoRz8Ax3owniNYCP1nhckjvHt8WKgIjIRFcWRg=
X-Received: by 2002:a05:6a00:2d0b:b0:872:a4fa:381a with SMTP id d2e1a72fcca58-887514f9b60mr681080b3a.2.1790773292919;
        Wed, 30 Sep 2026 06:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:872:a4fa:381a with SMTP id d2e1a72fcca58-887514f9b60mr680633b3a.2.1790773283190;
        Wed, 30 Sep 2026 06:01:23 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88768954f4fsm567114b3a.56.2026.09.30.06.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:01:22 -0700 (PDT)
Message-ID: <76154416-bd16-4721-b7e8-035aea1457a0@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:01:18 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
        robh@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-5-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061712.083BD1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061712.083BD1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfXzBFJTgJGlGaU
 wiRCsvXHuDS0ABWKDz3eHO1tP2K/EFDhPBBjEi0YlfUcLvRgjiayVnpQzHJEKPQ4ae8IjtTSO91
 2+ivUKGAqN32TsZE4mwnhD/Ivrd/wps=
X-Proofpoint-GUID: E5albUhmmxiY9Hx3BiwJYJ-cTpsJhCnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX2ZPafg/K+aGU
 FwSIl226rOmKCin7ELq0JIQYLkWG6jBvrHzEmnTVLV8PdKVhhdZvkrNOxv99zuRaUU4YV/Lb9hZ
 7dS9P4IWiI0gY1jRur6K51aeBBb2eB0EzLD+B7DPgkOLSrO2B4NKdTFUgIo4Jqnwm9M8cHPy9SL
 7mj3yPdJCVUKPI7NLdM0A/qcxorw3svlsM2ibGGjaY2Dj6V7lrI+D8momfsOXbIn7hGW9vSGtwV
 bKLsDlbXq7t+aXSy4SW0t7kuITTGCC3Xq4IBsxtQExBqJG8Spc7Drgc4rT5ym04vof1q23o9nFx
 8Smp5QWFsH2z/+xPcspJl4cLNOq+AMnWDjY6t+wqvkx9BattAMsIpDrXejBjJQQFAZpcdHzaKAF
 Si2x2ZzPIH0/gnLgexHQTqwKzVfQASLfLQh/7kOe+x6LOdgshljXBjtP5Q6pkHy4jWBZ06kG11l
 gysMtX2QjVCL65Ma4ng==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd082d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_s29Hk9VdzetE62z_GMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: E5albUhmmxiY9Hx3BiwJYJ-cTpsJhCnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051

On 9/29/2026 2:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] media: camss: guaranteed NULL pointer dereference in msm_csiphy_subdev_init()
> --
> 
> commit 3c87101a27e8d1c1d3a64a10ed465e1ed433c549
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
> 
> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
> which reuses the x1e80100 lane sequence, clocks and supplies but selects
> the v2.4.0 common status offset, adding Kaanapali power domain and
> register the "qcom,kaanapali-csi2-phy" compatible.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index a528760487bd9..a0cd839c9948a 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -34,6 +34,57 @@
>>   
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>>   
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +	/* CSIPHY0 */
>> +	{
>> +		.csiphy = {
>> +			.id = 0,
>> +			.hw_ops = &csiphy_ops_3ph_1_0,
>> +			.formats = &csiphy_formats_sdm845
>> +		},
>> +	},
> 
> [Severity: Critical]
> Can this result in a NULL pointer dereference during device probe?
> 
> Because this Kaanapali resource definition completely omits the .reg array, it
> implicitly initializes to NULL. However, it still binds legacy hardware
> operations (&csiphy_ops_3ph_1_0) that expect MMIO mappings.
> 
> When the CAMSS probe unconditionally iterates over all csiphy_num entries
> and invokes msm_csiphy_subdev_init() for each, it attempts to map the legacy
> register space:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
>      ...
>      csiphy->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
>      ...
> }
> 
> Because .reg was omitted, res->reg[0] is NULL, which propagates down to
> platform_get_resource_byname(). Since Kaanapali defines other named resources,
> evaluating strcmp(r->name, NULL) with a NULL name argument can cause a crash.
> 
> Does the standalone PHY need to be consumed via the kernel's generic PHY
> framework (e.g., devm_phy_get) instead of retaining legacy CAMSS ops that
> assume direct MMIO control?
> 
> [ ... ]
> 

Kaanapali use the re-arch CSIPHY framework so that the resources like 
register, supply are now handled by a separate PHY driver. We don't need 
to declare those redundant resources in CAMSS driver now.

Best Regards,
Hangxiang
