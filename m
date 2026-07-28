Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AAC30C168
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252707; cv=none; b=B8itVkfn/wZRxFlIMfej8mb+8fuuiUYhwMhpTExXHPoVO1wS1W2Y+K/lf3svZY9L+7+Zppy12unKq6tIvmhgqGw7xoTlpWL8gCw9WjHUWktr71YJuvhvfFvyScBtQ4IxjCEQlf4mgDQsPHd+elC17/Rl8SB8cq7XjWh/D0ccZ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252707; c=relaxed/simple;
	bh=8cLcnGV8rDedj0SINGa6J7pMzSq+K5IixnBHQ80jJMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jruHOZ+oQH3MG9wNy1M77pxVIkhuZ3QIERToTxN7vqfgf7rTzQnjq4J+4sYYj7lOq7gbsopr5iOMkfmjGX9cCIRePzZVe7jy9/354+w84foRTXjN38rvX6OiRNEeN9Hmek85Um6f3jHS0eO75w0RB1mXPZ72r6aGiJLxsQH/86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw1+KjPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CH1brPJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw1+KjPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CH1brPJ4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcq5n3239004
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=; b=Cw1+KjPfZYG/DVer
	FWXKoALR0Aj5UmdDQmJ21vhkfqUW35LQq7vELcB1BbZ8FhBavh/fDB+Liqd/Y8yq
	fXJKbMyJiJ9k/xLdLztA1hDun5HVlOTtmyLDkDRgu0YkwCj67FZnZyZ2jvW+3O71
	+pylT6qYiIdxbPjy3ccia9/O9yh4z2i9z1ffHll/1P/gnGlzDj7B47IEjEshngXL
	m76SJdB9RZcb9S0MLw9gYUxpNGo60zjgZc3/jNW2s4bxh3Bth07L2rpX7G8+9ygL
	vjXlEQSAv6qiUv9yPGjTU2ZkWn8HUoxm4Dt3AVUvQEibS3IuarJgGQLnu3XVFiLO
	5cphBg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7kpvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 15:31:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e0234967aso3296895b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785252704; x=1785857504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=;
        b=CH1brPJ4imHIetVY5zwCG/+OJKEQG2WmpAPIrgEQbWnXdYpgf54FEyLjjbRo5QKAxf
         S5ofTjDv3LYAmSl3s3F/3XrNzxd69BA2EZ4v6vVRIs59QBm5gFabCUQfrGhjheqtkEI6
         0nOca540SvhqhxZ2lto7oz4WAPwpkTtTQf1BzwBHGXmPqciMGk2JuguUquI8K4v+25Wr
         IRLiIiz4ZLHxoxlPeraXLFrJUy1uyZGTau7SM/yBvY7EA2Rl6dV89xbSrTF27q5JrWFq
         cs+hZsyrU+BJkw2jssSn1/WMlVEjsMQ1Z/MzmYNynvoO9ZCU2kt9poh0DYktsjfskqX6
         zZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252704; x=1785857504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krbL3eNapeKc6BfGfOARbyhC8+TaCA/Y0QJVqg0lx1A=;
        b=D0Tlnh4UOZ3fAgVOfN8IH5rNcbNlrvGzyb30OyyAblEsYrJhSNNLaQm/Kx9o9bbSo6
         2sXyZguV/r4YIqALC5XruR427tAurCEB2I72/to4NeL0ss2Txl8SqHSIuG7LHAfjgn2m
         MDDnfglcmV2vFv93SGOfgFcNjbMjbOqw4FzleS40spwKJ4mz4LJWKypcJlLAIi+T2bKr
         U34UOeA/Ew8wus+hV1p89OGdEyN3MvFSQHg2yVpIcUnSey6NDl3gfB+ruTTTNT6Vb2/T
         ynArWAPT1I8LgwFAmX5mg34ICHKMQ/2KohNlLqN+d9Lb6c14S3tKV6dfgXbjeyWTib+y
         IqrQ==
X-Gm-Message-State: AOJu0YzdfLtd+7YE378EWykbsqVhgW7YcvL6/TQF5H1rbR+H6nCJyCsj
	tCPfvpiFrf5UqlYjlXHOKy+RMKvyDnI1ojK3KZYkNN60+7/kQzS1rXga4WgHHB6w1CuTriheuIZ
	aSByGhcP+HINSWwbSey2gQQ0LHsTDaR1b0Jcv4BqGhUqDQCgQj6moCF1e4SKs9QU2D6XXJbrMjP
	8C+Vo=
X-Gm-Gg: AR+sD11JjZutyatnwWHgFp/5WvucWsbuYznKzn+0Xl+1XbGp1nCa2lLYbZ2GpDlyt1M
	mOFx8+uz+PI27ZzAlUs90Gf0BK5a79ba8HHa7nMO7NhsKtOI6oOy744q1v2hkHN60tMU8qGXPP0
	sfqQVn+VvkXylJQ0arYTigKGPed4Vi+glWtrfdfxxv2HXPJpb7EOooPAAZWeyIkPrHjxQ6GASi7
	v3c7zEfQIvThhut6IZ/tzo0Dh7whbGxVpzjOz90tzsJ2aWWFXG42LXDnNaYszZpvvVmCm1qrBC0
	QFLQ8BGB+JSKtyAIfwH5O1T/tzqVkeeKYgVeAxY65ddFcmhr8mdVcT6FzWIUwhJERAdrXm/YMfN
	AgbJU+MCkjxT/bo72No/y8Zz+svh8QkLelMg=
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr3596953637.55.1785252704145;
        Tue, 28 Jul 2026 08:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:398d:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c8ba618024mr3596914637.55.1785252703660;
        Tue, 28 Jul 2026 08:31:43 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.146.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb660daf6sm4764867a12.2.2026.07.28.08.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:31:43 -0700 (PDT)
Message-ID: <60785b9f-40cf-4b39-ba67-7dda43c7a304@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:01:39 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
 <20260727173123.A1B4C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260727173123.A1B4C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzNyBTYWx0ZWRfXx/b/cSXVQilG
 htOe+8LQYHKvZZ6Tp4GB4SGCkFGRULt05d7QFeRrpSJZTo9o5nRQxUpAnXQ6PpIcT2mS+6LIqwg
 sDwyQQCO/Qj6Tn3taVbLkMjCdoXTu/R2cLIZ3Nv8jP9F91kPXwfDB+OKEuUD0rkt6stLqE03PJD
 vgfstNkMTWHOL1+g68DGKd88c8UxGTAv33vGH3DQlbHLtoMy5spCraPdcbPTlh9kYNKuMuB+Pcn
 b/eXEWkLmv1zt8IeMaS27Ly3DCLO5pUshZ/8Ax5nIw4Rn5rTZ8pIW4TbrtD/qOTr3GJCBHQSPdh
 XsDUCJmxRtSDeo9vKH/nsYknR8HgatbVVaA19lpnG1MTDrNveUgTd8ppf7X66ePK2lOv/uMr57W
 7JgbgW0ZuRBOozZpJmfzl14hF+8Qt+vz3URiPCJa7InTgiGz8kX/dmN/ZNpPR62HUZuqpKOrdi9
 S2k7RG8pfWcL8tpwhzw==
X-Proofpoint-ORIG-GUID: rG9b7YrJzS1MPiVLYkDv-Jvoikr34y6V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzNyBTYWx0ZWRfXwT1g4tzDJrX3
 VilIYdcE9RS0w2ZfRIhQ/mTyES2SsBj6vNJdAMt30qGCMVfQeKTwEqwHTbT/KfuAiBkbt+rtyFY
 ejcrVfc+NPZZTkvwQh95u2iKm3zkyho=
X-Proofpoint-GUID: rG9b7YrJzS1MPiVLYkDv-Jvoikr34y6V
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68cb61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ivdcr2MBbwUSZV9J0j4ptA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-CxNEMdzEf_LT3fLqugA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280137

On 7/27/2026 11:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch adds the `pmc8380_6_die_temp` ADC channel to `hamoa-pmics.dtsi`, but fails to delete it in several Purwa-based device trees that lack the PMC8380_6 PMIC.
> --
> 
> --- Patch [4]: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support ---
> commit 506a2efbee2639e175314a25d3b48970c6278e83
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: hamoa-pmics: Add ADC support
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> index 394e65518ac50..661dca4fbee34 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> @@ -10,6 +10,7 @@
>>  
>>  /delete-node/ &pmc8380_6;
>>  /delete-node/ &pmc8380_6_thermal;
>> +/delete-node/ &pmc8380_6_die_temp;
> 
> [Severity: Medium]
> Should &pmc8380_6_die_temp also be deleted for the other device trees that
> currently delete &pmc8380_6?
> 
> For example, these files also delete &pmc8380_6 and &pmc8380_6_thermal, but
> are missing the deletion for the newly added &pmc8380_6_die_temp channel:
> 
> - arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
> - arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
> - arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> - arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
> - arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts

Yes, that is true, the above files need the same modification. I'll
fix this in the next series.

Thanks,
Jishnu

> 
> Without deleting the die temp channel, the channel is registered with the ADC
> driver on these boards despite the PMC8380_6 PMIC not being present. Could
> this cause a timeout or bus error if userspace tries to read the dead IIO
> channel via sysfs?
> 

