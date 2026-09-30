Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8146D2B3
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777884; cv=none; b=nR9xLFXWQO3i9q6u07zqj6iuNWnNaNDN26hjrkZ+b8Z9/227knOyFWhBTHzwyE1docDdPcU/y7qZEkRtJjBycnaUUkx29B+K1a1rfsWAtRIM3iyjKoh6/AgutGjYfGCliCvsGKhR8vSquyRWSdNlJ70W20JX3BKpVltMs36bNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777884; c=relaxed/simple;
	bh=op5x2jMUe3HR/valB6bXaPpG72jSk91BN0Eh2bCmmfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byyLPOCXGRqJdvrpEEy0gjdzLhpD5Ag5rlvALtYzb6CzbbmF+fqnc981D/4bI3uRnkGjuco5Q7O/z8RVyqX0/hM0hwhzwlT+T3n7k1Bi/pbuLjMIT/3EEgkqu0acp8SL4DfA+QwnZqvgQ+qA6Cl8+meAtlj+r/9Wp/EcTwi9TlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imuhky6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPAr5bxK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imuhky6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPAr5bxK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE04Ij2970758
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=; b=imuhky6HWATxTqQG
	UczYTQK1lNKfCgqlUjHzAvWkewbXt5P1GBb3lKCGJvSNwTGvciGXJvXvqcCVH+XV
	Vgrr14v7smBQzbrtwLLM49IR6nTVSWE+4KFld96DmpQuIli8H61gZXHFVfF6e88Z
	rs1IK9IS6mTqfDqdN5FtiT1pjOIl+J6+ea+XA+DgrI1bigCIurL1LgYLTTkSxKmW
	S3zpKJoFYqHPiLriAYJQBxKyDOXaNWW1uexf9wFZM+49u6HZXPm1z3mvf0Kcsv4I
	YsrVRFaxqNz6rpw3wpLz4DRL1X1cym59n/OrZdfKPnv3qUV0scqRd8naVreWaOdC
	d2rd7Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhek7yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:17:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso3295667a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777874; x=1791382674; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=;
        b=XPAr5bxKEGYrbNWc5IkLzKGibd1ikUC7G87Ah8rfIUqA7UIgwe90pVsdHiexetIyyk
         MBtihYRuPOiKgzPjj1c9RtpFRQdVxzAtIA/MWKdLzGQul1FvuomyRVcu+axycUU33+WU
         M6L9xfRlrc+bWOCQWoYYgj1P9KOg8+67l/GrAbu9+Q9P1kLndJ9pXNlGneod4WohfsPR
         tH56SqZgzQ3Mpe+F+GHKetdT/S6dIe5848IjklVV6X0J93gQ7vU3WuabNl1LrWNUmfa/
         1rvimd7ehUZKq5Md0UspMMjPYkKOX/vy0J4fUaoeJdJxbDR/iMZ71fyARaoY3EogfF5d
         XPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777874; x=1791382674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=;
        b=AqN8kj3LuCjRgsEuxzYWUFnbsFAPK7zxH9qS0PRAaSEYLGIRZeHCJhoTkE2UPHOUIK
         Ko4lTPkviQCAbsWvnWf8fS2xnS7NT5SQ4OrnY2db8tGH0PdAs3fID+wGjs/LClXk9u3m
         nUOpU3I+FRE0PZhSvraO+XG9aLvoQGgVCfLw9ffwnHGy1QGPytV5NG+NgpJC4ZlfZeRS
         ccu87Hmkuf8hfHDBBWxN8nXJiIFDFnjEWwPhNIKdYlaS7BHDp0VNzLevjv5UHYtPxIZV
         1F0Io2bP2ZKaHrke9OaF4dVWPjEjLKkRILCMGTrpRfDe/eNqCbm3LtmOsvvJrSTNMRUa
         8Ohg==
X-Gm-Message-State: AFuF++kssmfG+GBKzAq5WkuHYHzGe/JTcIDhNZZydoyiqImPYDmWdLBK
	6/p0J/BLVNZQTq1hYf4ArnSY1rbXo1rmkusfNNHvsIhP/y3Mu2uaa8780FJTxBsHbIyJ8OPR8sv
	OTNNQ4EPZO3NZq4hPvMR7Y2pRAtVLs5w7umGjgCwbH0ob4QKpFFqZTTqBzXO8S6auNibMgokUIf
	l4Pmw=
X-Gm-Gg: AYBFou2TzRSKv6HnxRFjyiPBcFDoEehpjOMQfuROq3N47B3yh/8IDYwxxekhILGSnGS
	xL0VDcHAAUzNA3I5Rgx9eG+wvEtdjmHBgecCJdAVzUNor5OaBg21TGoo8XVJwI4b2zYdwrq5Xci
	YcuQNrTYx3v7XnhMjL6pVPvUOtprm0E2aKXwJnoqAXDCUPVbNL3pWV0+HWgBuDIUfuu2Z+gFCKb
	9H4hC/x2bhRGRTwT/9453Bv56VIQxTgdL+09daMpp5BxfGiP5PgRMVxddErEhRWH1PGmoDoG8rW
	BRZbkJitKRy1Itwqrppn7B1bRA18RDJ9KORcOePq9W1j6BL2htnPaLvraDIdqIdblmDqKy+Sp6i
	fMdp4330aZqIu9AkxztSFzZNF2NK3zPHl2Ekk0W//N21Xz8HcTeiCwfhQOr7f2ls=
X-Received: by 2002:a05:6a20:9c17:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3de9e7ad978mr1665745637.49.1790777874455;
        Wed, 30 Sep 2026 07:17:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c17:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3de9e7ad978mr1665719637.49.1790777873995;
        Wed, 30 Sep 2026 07:17:53 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7d9f160b7sm1040104a12.3.2026.09.30.07.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:17:53 -0700 (PDT)
Message-ID: <dd0ddd6b-f2a3-4f10-9baf-7420e66d6a5d@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:17:46 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 09/11] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, olteanv@gmail.com
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-9-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061112.51F2C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061112.51F2C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y0sswDw6rh6rIrOMpM6CQ_a1dIen_Yuq
X-Proofpoint-ORIG-GUID: Y0sswDw6rh6rIrOMpM6CQ_a1dIen_Yuq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX4ZsMJf4mRP4H
 JV5MyOEys3CIB8FMTaZa4gVY8ak130I+1bRZvCw1a8ILDMgHqJ/N7VVr72dCaIKKpKV6JRio4a5
 iTz1VQdurVh5bUpP2HE5b3CAnvvMs12uljtxVpYztN+Wsoku9mm075crDlA2qJO0goedyGZfjZ9
 1ptOFJyjgjZ0SK+dOY/ofJuvHHQ0VG0Jm4nY/dGh3WaQH/W6rLYKlfcPVVvl9JHy5TiMYa9l+6C
 by74RNzP4D0u5QS+6yDVDXtVDnn8D2TY9htIOyRgSDpIUQrdm5yLaTh3dF4DcBlAjQgM4Loqpz6
 LbVdKdIxpgrztfllqWuRg38oISGqG6N93/CFyLZy+Ab3Gv8YujMWb6wJvspTS0kY0vQGeO9g8B8
 wA22Cm/VIdb0kypax8vK/hW7NOBlNMHG5MjPjfheCEdnl40PpcskB3twsld7LmUTG/PwFyK/vEE
 DxL+0UAMWrihvxajwfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX8zuDmmRuIojW
 rjgSRXTWv+U9W/ZbMjfgtzMWDbXwVgII67VynSiXZOx2l5xiaEURGoTWOV3i3g/oLt5dX+CJqEb
 waSsmMbtfAoL/1quov0b1rZfdljWAp0=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd1a13 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aJNJXID8IE6Oa3qSs_0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

On 9/29/2026 2:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: missing #phy-cells in CSIPHY nodes breaks phy lookup
> --
> 
> commit 0d5dc943d2ac26c65efdf11a56970db1bd7ff6f9
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
> 
> This commit adds device tree nodes for the CAMSS and CSIPHY blocks on the
> Kaanapali platform. These definitions enable camera pipelines to be configured
> and used by board-specific device trees.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 3e63e62251089..7a80438bde570 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> 
> [ ... ]
> 
>> @@ -3595,6 +3596,307 @@ usb_dp_qmpphy_dp_in: endpoint {
>>   			};
>>   		};
>>   
>> +		camss: isp@9253000 {
> 
> [ ... ]
> 
>> +		csiphy0: phy@9523000 {
>> +			compatible = "qcom,kaanapali-csi2-phy";
>> +			reg = <0x0 0x09523000 0x0 0x2000>;
> 
> [Severity: Medium]
> Does this node need a #phy-cells property? The generic PHY framework requires
> this for consumers to successfully probe.
> 
> The qcom,kaanapali-csi2-phy compatible binds to a generic PHY provider via
> devm_of_phy_provider_register(dev, of_phy_simple_xlate). When a consumer
> calls phy_get(), the PHY core invokes of_parse_phandle_with_args() to parse
> the reference.
> 
> Without #phy-cells = <0>; in this and the other csiphy nodes (csiphy0 through
> csiphy5) in arch/arm64/boot/dts/qcom/kaanapali.dtsi, the translation will fail,
> leaving the consumer devices non-functional.
> 
>> +
>> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> 
> [ ... ]
> 

This node style aligns with the x1e80100 example:
https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org/

Best Regards,
Hangxiang
