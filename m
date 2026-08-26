Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D513C09F3
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740806; cv=none; b=FDhncDEQBlzyyo3+T1o3lhuH2DgXwZ/snFvgfmrvnX74xIQTPfF4k8QbK7FUN/meDNCu9pZhc+jbNwbt7WK7O20vWVBGVuQv96n5FYtjoDa+JesjC8NW0ow+OeDWGxE5Oo2yFdJt20LSkVEzBt+N0mUUYLrN8lpIe8NS2kPpJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740806; c=relaxed/simple;
	bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgGr1hsUrIsyiaoctmQLVlgrazw5IMvxZgSJTU3GcXp1zCtmRVCcNsRvwKDZO795bmskR1UERpD5JQoTB5i44F6HllPR/Wsjwyjbeevq23oLtVdUcTm165x/II3Zk7RkywX4GmS5uOuEAZbqe4iM0dcug8hkpbGmRwhlddQ2hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgjcUfau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVtJFJ99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgjcUfau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVtJFJ99"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGVAO1209716
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=; b=AgjcUfauGbhykqVo
	kd8npc3m7cTdQBotFjibBiGKBxG/eRPBbEmyuyEhnDPo3Z1OIxT3Dv+Weg0qtVqc
	IWodV1PGrCKi2qpJ1YwufRgtYxQjLl8uoK1tbYuopwvec6RDKc0G9ErcyOI7d55L
	t+oa7QhmphANXEcOENHZ20wCkNNYC62yuQMnhrwl00lW289wMmgUeVv2Mt+FrI9z
	IylZP9o2meaaqFXl9JO9AULJZzyZ6PdhVxppbFx1P0Of+LYBfUK0+2pdjZAjY601
	KHPO4OIbhH543y1ZN32ReObSDdWO432Xbap3usFY3hxdu1Qea3rGce+AZLhkMko/
	X4U2yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkg4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:40:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso9458711cf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740803; x=1788345603; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
        b=QVtJFJ99A9D9fez9yt1ArhyuMZT+tN0cLvDLpga8TMyVuUmBAnr44ncdKD07zNXBhj
         +hs1Q+b0Uq9iba101PEJ3FYAYmJoW3MTBGHNpZN16/qTCBUtaY6sFpu2o8xvHJooVG98
         o69wKzcM8yToVaiOCO6hEsBZ8PIi5PQfzXKKJSwBwG1zyhSbbHB7B/xk1IfTvxWZuod4
         zJH7bS7f9+qpMN/DN1LmhpAF0ONodNjkxYR6QlWdd62Huui3Xgkxo3QE1iitKM2toOLo
         gF33hs/veIjhs41gwuwTcQBDqnWRVHyfvbVQGeLEIj38Livua9EE1iLPVliqRmaBYxlt
         Ay2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740803; x=1788345603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
        b=D95AlAdHRH3IbFu2cbiC/JFScFbOFpj7/K944BnhEVluGXQ0IV6Di/pY8qP4P4cvsE
         t8bH//FMx5sGAwhsYLaDw/Pgwu5Eyw5ftSudG99GR+b1lJUHHaHmrN0p+tFagcPEmpnX
         JeKd/9HD78AR63qJ8jSMnAEF90VdwTKLSDQAxIkROFqjfDy2TdD76alBGWE7yPs1h9rs
         cp7y21YgSCQYYBLHZAm+6s/RbOssY5aKp7mvwPlU+JqWdgmKjCvbZyCxvUtTl2XJhdbQ
         d08TyLfbF8NicnLZLsaRgl2jEHdr2wmKFyMPDwZyITUCA+L28vLgtiBRPamokm7K6f9K
         nhFw==
X-Gm-Message-State: AFuF++lrOlk7xf8YYBR6Q3kpiVszlo88i4wBsK2LXSRHmR8IvNcrKQfJ
	axeopuHa7TV0wa9D+G07ccRkIE6vTThwnFTbkWpGMEclLykrOdvgSYpUmM9XRJxUZ7Mj24tOY5N
	0/xim3ICiDTMn/8u10slLQ5Tgz+lPMv3fIj2XIk4YC6pjLHZ95MVMlaUcN9OAEkQUtfrtxz8aNQ
	hsegU=
X-Gm-Gg: AR+sD110YJXXAH31hhpIS8Nmec0K7COsFSk8Rj8YcDqM38SFCUfSuTRHi/DCkMS26ac
	e+FXj6KwSNGw0xsUE+AhnAA/Gfv5aHgPAfgK1fTq2Utrr0j4rl1JYQo+Y7FGJukdi/rUv06TWBc
	q40fL8iWsivcTLqxxUxA+IzdbrXtctZ3cQu5rUtDtdQJR1nPchFUfEx3vZ3j+ptxGth3hUCgSWt
	Tpm5jB66AkTGvN/yvanbVFaHof6q/ER5zk9xzZyzSpdYdVfkXLWV2jOflQTFlDrdZlIH+P34Tx5
	7slyC+AiW5nwFpGUqYYwoFtYIuNnVbSDqRy1ERuSKDJ1ts/xACZL2nYBaAf41/ihxVA6RSxBdk0
	xxs76v3gZp41NjycgWdpw3KLc7e3o
X-Received: by 2002:a05:622a:c8:b0:52e:2d1a:6f14 with SMTP id d75a77b69052e-52e42328885mr53724111cf.27.1787740803314;
        Wed, 26 Aug 2026 03:40:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c8:b0:52e:2d1a:6f14 with SMTP id d75a77b69052e-52e42328885mr53723721cf.27.1787740802802;
        Wed, 26 Aug 2026 03:40:02 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ad70sm461839266b.38.2026.08.26.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:40:01 -0700 (PDT)
Message-ID: <13e248c4-d918-43da-b6cb-02402ba2293a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:39:58 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-1-fdd16ca6e771@oss.qualcomm.com>
 <20260826103032.56BD01F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103032.56BD01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ec284 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: K3CwUcgTsFokrC8Y45hfpUj5YsPcFUfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX/f6yZRMT573H
 sTr4sPIU93CXuz3tIc0q4coQS4Vy1lxk9Ppr7YX3sKWrGrnG5bmcu3ym9Q9yTseDYQV8gZ6lJnI
 gqAHC7WtcwrthH5vvITjl4nGDbWwNQasKXJyGei0haGYq3J3Yi8GI5axtwBca/WPkubKUBvqET6
 uA7QZyPbxfod980PddgQDDSaF2lxaBH/KtwjAo4CTstp6rGvCbTTMfua70RJqdcj81z62nleeoD
 yGvjj7LAzTqMTvEv0MxZ5lHrRNUzear8nH7hGCH4KnHsrnL5avoO05cbQkvwdAOcFc/a2uiEZ24
 XxVC9RBzUQfUgughzw7um+kIPOaajKtqfldc2ojmst21pTGWUeOSGxTXAbIVvM2EGSDxg13VD+O
 hHtwGwu23RFTMo2SlQg5Rk3uIXrXfFVLfmzdFOyX+y3Caxs7CO/C5XygmVU53r0c5JPnYzYkGNx
 gDIsEPnRyUrx+AOr0Sw==
X-Proofpoint-GUID: K3CwUcgTsFokrC8Y45hfpUj5YsPcFUfz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfXxfUoqAfpf/Pd
 MVg3duI1LM8KSABGYSX49GWxiENWXyMdJ7N3XNcuReClmjSiYzOM3CpLV9qNZLH0DpvwPiSXs2/
 IpQYTFwfl7ZjvEFBemG7gxEEngFkOHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260088

On 26/08/2026 12:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Strict string equality check for root node overlays fails on variable whitespace.

ack

Best regards,
Krzysztof
