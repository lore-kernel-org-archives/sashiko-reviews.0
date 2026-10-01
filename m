Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD550AC33
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862943; cv=none; b=DyJDc2sTeTXhOMTRf2iVIgiINU6IyIx0/DI6W0PNw3fILyh52XaL1jIUi0zbmTLpGOWvGWjemy4UxGQhsSInNglPkoQuBatodcXXOgmqAIrOa4aI9hX0wqgYzwMXKDUTOxyBhGku0exCslKOnAX9X1PpOb85SGEB09WY6i1x3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862943; c=relaxed/simple;
	bh=iM4k9v+FWnYdhh+RUe247xj2bTwVAPB85IccLeZbDxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c01D5Y2UUOLnlkvYm7Rl2UNkA8ZpNHoTD/VMgH5F02+9Y7jDtzDc2nQ6sBxbzhnbM552F+hCcHjQLxTtoKEx3NwDTU8TFmrWn+i19NI4xIA2E2l+iXOkocIYGopqSQ9wMkJ/p8mm6Lf9CcXa7caRSz1qKav/i+iungJyQ4r0m1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y79mmOjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYPS21CJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y79mmOjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYPS21CJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dj4oQ2188558
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 13:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=; b=Y79mmOjpMGzRclah
	VfoYN8SWOOlSTtz+vD1w3HwLwQpVX4t4wujQJJFJAQEtHA03M9tHJpfraUoqDyC4
	b5tF0bXpHUuAIrlRt4RrJd+uMpfXbtB8GEl5PNEOy4Me/SoNbSKTlSKufi/z6d04
	SnMae29t34L9qvQpjydCrvXWTOEGgdU0MsK1bacFKM+8TA/daLesoFEkVDXJPF0X
	OtknGjClf8vmJuZo3e+xfgF29Vkw5PnvfYCTi2OaKpAek4CWCddlsMCU8+Gl/P1T
	gb+cpPkUVBll42gxgZaNYvCZtIFqh8kNHqEfB6RsrPxGh3HXNYyC8tBKfUs5+sTe
	ayKnig==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjca5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 13:55:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso6858345c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862938; x=1791467738; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=;
        b=IYPS21CJ9AUr+6KABOsQRpt+2Jfp5H4sNS2/rYo6RldxVvzxBIrxkNAEHVVNz5oori
         G782T9Mf5feQ/RRfymFKyHHaJcy2/ZL4IR0YCx2mJ+jnLyKc+yBh+e61BNxuWS9jnY8x
         7wUQCIMgDVT0IYw/oSPImaO+E7S3SJlMhP/d9YuU7CmU+KxlI07CK0/MxQjVTIVaPqD/
         BUsm/Kcu5ZimZ0THf7OmSAKwAGxqgxzaQSo0DUYBwtM9pATHfR5ZSoU1SzqkUVY1qnbM
         9e9aAjk1xlQuZoMJPGTD+y38KK4FbCNXquKAqUiUAHyRNsvGdQ2cZ/n5tWMujcVbnJZO
         fy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862938; x=1791467738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oFJMmnDqr2y8CcL25EGGYAYefN1maD9v9sMlG47tKo=;
        b=ODJfJsRrdxiuIB8Uv6fd59xV27IM1vozHbw6mJIike/M5TVm4kWuJycpmysO1nOCO+
         Hrh/93du1WrIZREiChP4AlEezuRZrwh0L3hpjhE2PGT7Hva9VLcAGrf0drw0r7uHYYjT
         3BY1If45ogIyXOMHQSLhoURRNMnb25eCt9HtuS4Fvrf1zl/JBAZwZ1/yeEpCqM9VjSol
         IC7E4L1hKs9Xk06L37LcoDIMc3gJrDUJSoQFQ8ibJiNmQOp0pVbiPKDy31Zj8ljeAeLB
         UCwgt1T6jvKZw587dapBWSeA3ie0oijr4QwjemOsT9PFi+u7Gqi7HmbrWVPFQjU2tI5s
         ul9g==
X-Gm-Message-State: AFuF++kjIZAtQqI5GC0phZ44GMUF65WGcVAxW6E6wEqBSXE7A3wnXoyb
	cSkWqTLzVXBYYcIkyhGGBaWHL/X0wdAvb3QWXfrDUBwXqqaYc9nXOuOTyz3HiXNMLT1veRfeWCf
	Hcm1zsPk6ZagQlcyNCIWp+QUgkZ31gi07fk6eVh/ATy24Ml9t60tvv0Oe7lzByUdPn6bj05RqJM
	1w4Vg=
X-Gm-Gg: AYBFou2pVd6Vk6Jfai9hNVtynLPW2SaXo46E16xCoJy7eECJnG2N3C/IDo76nz1MwMG
	lrKKnXqfSsYuWxsFMYBjvDHT8Z5bcs7wpvpVG8LGkhLZxugoS81RLJ84y4phqht2xjl9nxGun2/
	19bBFh9Cg2PE9ebtMk/u1Z9+c0LkQid/0Pw9rleqjvFdtw9PVSC6trK1KNueakLXcP0nSaTyU4X
	kNTbxc0ZcFYYBwnFmAlZX7UmGUe0/ZFXIXoVX3BWNuTDjbxdMD+V9P2M3xGHK2yLRYuuTd37A9f
	28564fB4YgRvKo1yH+Qt/NpCz1ue5I5fhIHRpm07emyhkvEz9VknXthqItRsVMTkhCn32EXcFa8
	VzlG0/DOSRlRQMZ7ddVwR8gKeDY36GAE=
X-Received: by 2002:a05:701b:4244:10b0:143:296a:4e58 with SMTP id a92af1059eb24-14d328ffce7mr4673516c88.27.1790862937790;
        Thu, 01 Oct 2026 06:55:37 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:143:296a:4e58 with SMTP id a92af1059eb24-14d328ffce7mr4673482c88.27.1790862936950;
        Thu, 01 Oct 2026 06:55:36 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df40dc189sm6921469c88.11.2026.10.01.06.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:55:36 -0700 (PDT)
Message-ID: <c14ee77f-5413-4c0c-afc9-269b0a6bf3bb@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 19:25:32 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec
 node
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        robh@kernel.org
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
 <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
 <20261001135049.D945E1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261001135049.D945E1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe665a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bMxCJCIvrp3_V2EDkisA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: nBgDP5G3zSt4MJNt5uKYJAw8wCWpu2yM
X-Proofpoint-ORIG-GUID: nBgDP5G3zSt4MJNt5uKYJAw8wCWpu2yM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX3ROIk30MiqDp
 duo/b07YCVWx074BfF3w8+NcR5fXuv/Fl8Gffj1zBx8Zfe+wC42Dgxikr3EIPNPa25Z3+uZu/Q6
 Fssiju2eRn9zViD3bUmxaOvH1X7su3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX1mKfdPiMmxa+
 NFM8Lq1oNZjbzWoCYJE8o+zI2jPatT3UACFSZYi0Y91yhg4ssCC7J82b1zZ52tWsrlFl1YHMXcf
 ZJdFR3q714L1IS05rb5xge5L3/4oW8rNgcKqbO5WN0iJ/h2H3wW7drmO1ERiy/Qv2+/Y6ZJ4z9W
 m+vPuaRVcJEJ5Dd4++zhZN/PhvKkFXA2T3+Wj24yg/ZQvKtwtzL1hoZrt8ZmosixaOrsPVzBYTX
 kcjzWJdGHmc2ZP0FDqYk4SuIElQvU1yyzWc6c5qEYQWAqj3UjQ52MywbxbEQIuQmfsdW6kIHBgN
 xFr80X7MTgNE9nQAkgPn9eFU1U8j0GoYR60Y4VfIspbvgqQAhg/YQaAHbXywhUtig4U7iCFkbR3
 t7zWDKhal8cQyvrMk5VUBJpxj0jwtnwdy7lu7iSENSZ7dyf+AM9kiuZhLv8zsrrgLAIdq7zJfmh
 aQnER1bRNYIL5F4z5vA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010055


On 10/1/2026 7:20 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing qcom,shikra-venus compatible string in schema
> --
> 
> commit 72de37a6e4a3d11559749c7b3aae80f415758b83
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: Add Iris video codec node
> 
> This commit adds the Iris video codec device tree node for the Shikra
> platform. It describes the Iris-based video decoder/encoder block, allowing
> the media driver to probe and initialize the hardware.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 9823c591b02b1..d2e4db4025dcc 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> [ ... ]
>> @@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
>>   			power-domains = <&gpucc GPU_CX_GDSC>;
>>   		};
>>   
>> +		iris: video-codec@5a00000 {
>> +			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
> 
> [Severity: Low]
> Is this new "qcom,shikra-venus" compatible string documented in the
> dt-bindings schema?

yes, its committed with #fe12ccf5a98f (dt-bindings: media: 
qcom,qcm2290-venus: document shikra venus compatible) in media-next.

> 
> It appears to be missing from the corresponding dt-bindings schema (such as
> qcom,qcm2290-venus.yaml). This will cause validation failures during
> `make dtbs_check`.
> 

