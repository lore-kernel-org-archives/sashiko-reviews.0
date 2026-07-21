Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D129433BA8
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626894; cv=none; b=j+tm4dCW8+KSp90c8qfPyNahxL2Z8BfpPOsXtLNGYTJ1jXCq+P3ymcrBLpIkerAkcHcJSDg636ir6hdkS8/lX6ERQtJQI/eED4p9fGSj9LJgJ04qBO1Nd0WY50uhyne7oHORNHLaDtsJ9aH8fsYTDbt0D1UDcV9DamRik5UkNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626894; c=relaxed/simple;
	bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+MJX+WFWnNhV4f4D5sCAPsvxk0pz28xd1gKah2buhEzQ31DNY0gb03ZPcVckxDNsPfqM108T2dP2tre6Zg1fHEVnVQqV6bkX5eU63McfF0mjWxINNdhVGI1+3rU6nU85SCZDrr4W2OSv1yB/UEyaO1twU4k/NzOdr8r54KtLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osZmvz2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0AJl+jO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osZmvz2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0AJl+jO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8925T091469
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=; b=osZmvz2OL5eaeetf
	uqTgzO0QghX68fNOSXs1rUoW/ihn9eGV2RADc4HmdMc7gWXhCmLEiPK2fQn5icvu
	HiwYRORK4y0YZCJ0gAUlty5pFFQer9gPBG/OHKoe4dqlJyPznkm1R89AHozE4r4+
	76DFumgj4qRKR9JN9BJxJ26Jg1pCqdJyAfbU069ZRW44IID+VFfwmbGwE5TL4LS5
	AdXCF1bPKR4l4ioB5RyD/C+ihck+WVDltyKrK41vkDiIXnRzc8H4LDVZrA1sf4IU
	cV22+1U6Cyj/grCSLF6tB1z2QvJzghd7o1hH5uqvBHWix7sftWmGrv1f/DTLq348
	shzZsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a9w8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:41:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso1730087385a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626891; x=1785231691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
        b=M0AJl+jOjqYMqRANxOuW6m1SnEYv7uemF9l1dRuBw0/+D1v4RsrrjFHk39+0yNa8of
         bGkYmG0ukpCcB/CRO1mkODZRlZ98c4+yiZ1y2ytWwtI2E/RDyMF/qtyhhvxh7/vqDqwu
         U9hvhxSkUxqsucAScPt2hK4Iz0WRMFBI//ZBfks8sTtXZzytbWpj3S+w47oyN459LhLo
         VLiUKvzvBovZiuvC31Voyt3HnnEfHxDAiMby2SogfEZZWvDYLbLCfWD04jX9iY88kRJa
         Cb5YOLz13dzxD9kRexQG/myzsG7E/WhLx9I/7Bx+agn/GPvbut9djyV4uRuMNITtCCdi
         P+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626891; x=1785231691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
        b=AfiAY0ERivDhDN6WPa3HgU8ZdDDezJlsKjz+p0SBTnnduN4e5WUXlMxgPwr0fMe/ta
         tNKB/7hS/V0TSHtfMx21wDWW6IOqG+MWDLh1xCC7WTScRXl/WqZbG2Pckd+vVMflIDx7
         +ETzpZENX5GiySR0fvWHtTv1iXKUOblOMyWMHglSHA7ty/16wEUgpbZ4N1Sk9W81W306
         9cC5HRppU9PONEyH84Fdot5DsT9MCFQcoMhqmp0Pl7KNcEvSKaBiGzdrGsg4ND4WlvaV
         jW9nTX6y6YEQb7eUvBKJaBhCXQZg7B6TUNGUSZOMDeoES6NVwnT227yGWcK2c4wHqd+X
         sOOA==
X-Gm-Message-State: AOJu0YzsBV1MMC3KFcqXkkd/bUloAPJ7ZYZHbChN9Tg+/lipSNVmNYwR
	F7/KNzqLc/Q+8xFyWqlI7z04gIiN9HdRv59xRxXkNZMYhJK5XAy1U0NU71cE/udE/xVgM+hnS0t
	kKeWnXCfFKZMlhwN8y20U7yKzkoLtwh0dnT0loCk22IM/XUu3l3doKI/M+Xaph96aw0Mq3+xpS0
	QKcck=
X-Gm-Gg: AfdE7ckSQ5VxrCBTRMVpktWRBPm3AQUljarbShNcs8T6FvTZ6/+PZ8pAeg5srTefNRE
	rqQ8OMpUMo/TsTBKnxbbRK7lyhFeCjuTbmP5OfRmvFjRMAs6FJ2pyzCasgKmayFGpJ7syjwFYU0
	iK8J25Mq3J9tQbPDpKkLirieU2PexFpk0RZIrgoPwihgzJpI5cpr8Meor4fop31FqfOPXDO2Pfa
	/TGW2fktOSgPLWFO+AsupES2pWrwo5+wI2byy797moYBMNvkszTorEKA6wkfpZb4iv/rnr6UXPa
	W3EnM/n5BcM1SEk72+PpEIfOs9AYWesmwKKCrCM+HXW8hF0nbTGI/HLOigsF/rnJgvhKBzAiFdS
	JcxlXYr1CxvWDXg5Yqvklgqi61pO1NA==
X-Received: by 2002:a05:622a:550f:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-5213fc5a30dmr160266341cf.72.1784626891216;
        Tue, 21 Jul 2026 02:41:31 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-5213fc5a30dmr160266191cf.72.1784626890774;
        Tue, 21 Jul 2026 02:41:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm151004905e9.3.2026.07.21.02.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:41:29 -0700 (PDT)
Message-ID: <2ba9ce2f-6538-4041-995b-a04a15e81b07@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:41:28 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260721085711.1B1391F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721085711.1B1391F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f3ecc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=hK_jsVp0PhnOJfhX4HwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX+0k1Ap9MxBPG
 LFHBplz/kWyl1iEa2keM+4bkDib3aAnKfaLdvtt7TTOHpU7klqemenyFQXZZrze60bQMyEITvPF
 o7zgnFS41gyXDJ7O72CjbhUs/ft8kS1+0TzL/pRKVqLeqF0dVxBgzN6ABsYVPgzUEeoBkZNsIN9
 m4lMJRA3YWJH4t7BX72Td80C1PD88AJeMzJa32qWSi0tjyVC8cTO25r7/sEieBIvA6MMiE9E0+U
 Hw6HRaai24XaA5NtBLLHuey9P6uC3LCxALwmr/KeqWRuVXSuHOd3lJ/uodbj6rKrRFKv9Ew+xJs
 IPgObqkH7eYn/ghRdcMkkEmnKrvHiz91ZaEt5USii6hBnnRcHkcyW8k8m7XC3WNFwnm3oq6YVFD
 bXuyw7Ooo1ukHZotQfnUjx+pPI66sCFCEWN4b6smB5BDhqVGH1u5bYHRWkXJt5+6l3leAzjZRC0
 ufbreqSnvDMqC2xS1fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfXwMrQ8bxW1IRD
 9r6BMNnIl7a/ZR1BBB7Bj3Jx5JqkyAwRnTkq0zx9IKzWzy2rNASg8AyxqYpUh6MZ4Z8ZkhgzMbJ
 R9V6fb6SRBL/M2GxFPZ/5Neu4bLj8NI=
X-Proofpoint-ORIG-GUID: N4acWTLZrHsqX5iZK4BlUQaXoXNANqW1
X-Proofpoint-GUID: N4acWTLZrHsqX5iZK4BlUQaXoXNANqW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210102

On 21/07/2026 10:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch inconsistently adds `qcom,glymur-adsp-pas` and `qcom,kaanapali-adsp-pas` to the `power-domains` conditional blocks while omitting `qcom,hawi-adsp-pas` and `qcom,sm8750-adsp-pas`, and these explicit additions are entirely redundant.
> --

Good point, I missed the "contains:" part.

Best regards,
Krzysztof
