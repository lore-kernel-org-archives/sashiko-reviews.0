Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E2B49E5DE
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856600; cv=none; b=o8UkABKW+5qAiFZRa5cxV5KO63qaUfULR7SIFZQ70X9/fsKuZCT7Oo65Kk4SymOREziZHiBdDMbKwQQo1Bqdr7Amrp2aK8W2LrWqMqD4qTURuO2/Vyxx/ieG2+1O7pUETYdSb1p32kxlsetnwk2wGHvIYYJYCH0+65rvzYvvaVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856600; c=relaxed/simple;
	bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ7XzGNh73ifuNONOk2bKd3Ntx3+/8k8iiLH4YS7mmBWxshWaqqzWS8gmbrTSYzGZvcuaQJcCMx0Z4CwLcumy1uO+KcykjGn42E3xEdw37szhM28otwWdl19i61EorEmNmVTiOqVKxaMT08tzeqfmTBuUgOuBCsO01NZ+S/Xlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkOewvSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb3xqBnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkOewvSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb3xqBnQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M14H2979191
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 08:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=; b=mkOewvSRFnOF0E3+
	qq1rNZ1Q8vtRFjpVAdEKQA6fxCJB8eOppF7CfUdX5QMnn2CpVw9/cO4UIaskeY+l
	18RnIebbn8MdK+tpCTnb08hweR4BIdJFBEUZOMJtKhsdbpHJBkj789oy5rKjXloX
	2I9q+tkyBUUhrCNDn8Wh1cDXrOqIqAq3nzqVVhGnK7RvVfspDErYcxf7+ImFFBC+
	HnY/gpv7kuV1PEF3P2UwaeeGTyuZnh90aNZ/j2nKEFlDWbLSX/m9TEdr0TbBL48f
	304e5L9qbQw8Ay89AedMSNdZnw8if4zX6KSen58i1UxfJZXIZMGOZWedKDZOaq1/
	wuUJRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbxqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 08:36:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so634855585a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856595; x=1789461395; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
        b=Qb3xqBnQGE6we8No3/MNy+EFflMP64WIoYNLfMfmjFEjCHwBA4LKTLw3c05XAJRhip
         Ss+2vAKg1+DEczrpymifi+KeT4Pm0AsItnIOmp78Iw6YjGCUMqf3A1A+hIneq/6Nc51Y
         p+nhWCOF7YlAPgAr0Wln6AAY+h875EByxHpDoSlzo9urWRdc1LhU35gNHhqJ5zfPneSu
         HU3sEvcbDOcNvOukdNT4KXMTWFjonNuwjP6EJJyiEG+SKq+rpY8+gEwMgajRrNEvVkWL
         Q0UHvyWQdIBVO8Y8Wi7VNVZBnrXjePbzEBN7hmwn0PL/PIKTEEsQo+vB2Z34mxk3B3CW
         2KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856595; x=1789461395;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiYasFIpEE/Y34RE614DnJmliaBqbzzu2btysmodjNw=;
        b=BnFodv2EMnj213SA62wjo+sCBwC6OsJ8TbribrNTsgdi302eTxkKx6kYTt7yvYfZma
         MbHJzzv/tpCUOyASwa7YDB6jlqDl2hDJSt275u19mRLMbRdT0N+sxkDKoStpz3NeBNYU
         M/23H/1OiH9L1qaLjG1F/9D5gjuI4nduIwJFVBKhXWBLBH5PE1PcnorQeUTVsUT7FCCg
         6lsHSLX6GXn52LjrTGjVV60h0+ptdedWoOasliGMUiODaernkBuWQgDS7DWW0GZKbQri
         AySGifT9IINK+YfKBmIRaXoufBArglE9CWWfDUkRutq5jAC2KeZgH4gMMnfdNqbGXOQE
         O5LA==
X-Gm-Message-State: AFuF++kB0gYtyBJu9I4OjJKnZsPWH6qpDjNhJtTcm0cw/2KutrYZH8G5
	8rMuZcl0ORiHRsbfYiTY7vP4WCoe3VfMoM6Q1w0e7t+1xBao4qoGFaDdnOCbyY4Od980p5jSLKz
	Xfc0IHBwGKXonSE5Kyg6HL+Z91ZRndHACgUHlqEOfI95klTZkAgu8wmE6WjwZylNZnrL3EYwOw0
	VIyOA=
X-Gm-Gg: AYBFou100SJxOsmESIEGJa0nXXanW0PRxNebACVBqsD/0W2M3swcfMqoq5s4my7RyId
	OYHVCdXPWbjg+5br4+FO11F2kQgri3gvx9gBIORWhjAlWOE0VJW+SDXdWn50MJ9c8OyvMKXdgUw
	maAVhEoxEf0oVz/Gak7P0u1NE5A7CPSzesc40q2g43StDqhXEfB/XjBJZUDp8zuFGICADdK0NNh
	uURSvwk5M1+YXkDUv4bWtDEiDkpaW0SuitLbNZmmlUKHottz7RtGBCu7CC/fZ6VCj/oVQH/hVaT
	/n3IUUjVinFApDj8r1PnmaXm9eo/oMQUn2AGZlfOUDyhoasLxwcxX2+qOHT1TIP9mm9M5Paw7we
	Oicpg5Lf6rc5jSxDhZx3ImjJYIbya
X-Received: by 2002:a05:620a:46a1:b0:939:922b:3de1 with SMTP id af79cd13be357-939922b4881mr2238182685a.44.1788856594821;
        Tue, 08 Sep 2026 01:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:939:922b:3de1 with SMTP id af79cd13be357-939922b4881mr2238180685a.44.1788856594450;
        Tue, 08 Sep 2026 01:36:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm482095385e9.6.2026.09.08.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:36:33 -0700 (PDT)
Message-ID: <0e876b5f-13cc-4fdb-b7b5-78621cfdd80d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:36:32 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
 <20260908072249.83C5B1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072249.83C5B1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXx324sNk3Rjml
 7RqfcynfP1Ytgez74+aqV+AecebO5mBAX0yw4QQZ4Lfyp6QpE1arY3qvNFnQ5IZhbkx4Kl0NnOi
 RwYb1kFruGVPDSH/pqozszB4+I/Lb2Y=
X-Proofpoint-GUID: 0rnFtN1S9_FBGYPfqifIn575WQgU2jug
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fc913 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=12aO51z3czoBTLisYu4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0rnFtN1S9_FBGYPfqifIn575WQgU2jug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXxhiCSQs+Qe1v
 5djr36N0dg457ll5+c3+t+Sl4UGwFcUCbG26br4C/cKz3G7oj8S3gM5Pw6i7vogz/BeqS+rmyvf
 4agam+7YDm6fxu/F/TXgYVJbsfJmRzH9wURJWnoo2tUoXQKEdgQyAu7gmA+oniKDcLmXI5JxiNf
 tYbBKjrAK7YDb3zxW/P8ZWmkydt/gPYEDh2Zh5Idnc02zBbOr504VCezb1eoS6ASxgPmq4TnxN6
 WAEGiU1c5RnL+Y1xawtpZEERiEoN7eKaPWXpVMDHRkGKe40MgkrKk44VguGSLSkxcxeRFsKdcjt
 ZT2fBQ0/qOvyuWG0iImVn6spw6KfirBwMf6neIFr0KW7RksOEfIkyI+9mOV9f3mFf3npi1PJa29
 afomOGwaYr3q6lKQbtld+GBL3uOOWJ9mNB2ojBe04stML8ZYvJZIiRLzgd6TuDUH72HoLqSznpZ
 ntwUQYu7j1kfsS5SMiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unclocked register access in `msm_hdmi_bridge_atomic_post_disable` if `atomic_pre_enable` fails, leading to a system crash.
> --

False positive

Best regards,
Krzysztof
