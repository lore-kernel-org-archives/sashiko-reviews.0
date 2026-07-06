Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5E380FDA
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322284; cv=none; b=g1QjJhaaXGmikLMNJvSs7LHQL88LlPhDKhW11/968ZqT2yAjLmH/p+2eRPptKr06V4GAeOygrdTvTmmn59mHp24sN6oqugBfEKxlYOblzYIMjEW1Obmd5tPQA6xtSsa/bz4k6LCJEyubgbEKRgiI3pu7J2RnZu4FYekL6p6I7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322284; c=relaxed/simple;
	bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cG7j5UbIQws6icBtDDIOuxFK+H0BY6opjpNsE0xD5j3Ngi5+WLB/+OxxVZs1oIXUPOTAMOjfl2EXkDzoh7Oa7GDkYYmNlNEKJxQgGi0ejeemTh06cWFhMY4/Dgqnqf09vNfqEbZudoYx9Ub+SOWK+JdpFCx9fI/+Q0ESz41jdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETFXkgzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7I7bfKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETFXkgzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7I7bfKb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641U323615494
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 07:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=; b=ETFXkgzLG69wYWdI
	oQuG2jhHZq8qv9LQBFHD6FsX8nBglJzr55RTL65rh4ktdiaet4l57tF8GQ6ZswKA
	vZpn3GQy/odsNDhEU+BwKLjJdKftzL5ty7n/UD4NzrgZ+h1zGNBNojt5+6+Ib0kK
	p70CDhwhK05dqG1EoJJf1N+wTIdqQgan+hjvkR5+FHk6iGTKACEQcCU0YglRpayG
	KZrrdTMsFwqdovnvA/+EQPBpWzAyaZosPdHeRGyU0s6ybId1aldAd9InDEbcxua2
	7cHunYZkJHMfY5H0osNtZ3Eo7+BU6Z5Otko1fqtPFm5nZF9H6WwuwYn+/S1KosHQ
	Ohlz5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cyut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 07:17:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so274126385a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322275; x=1783927075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
        b=T7I7bfKbNFtk5n5v3/wU4Bx865VMKE34XwbKoulByDHX/ig1kEP9FRN+3jvLdBdg9P
         qmbWESROAzn66aQI05sY3i3mYiFYe0s9UJUkEFPEjzvUJFqg6TDHh/WnI219dthY1imG
         E7A/AMR1/3w2VOVyOv+W+9NMmJp05cls4GDGLlmAKiRzQlPcg1/VwMH4KEHaCPfsepaT
         R21vuBNTOzqYBDd+7XHZdy7woB20zQWJdaSJ1RH3/VDLLqw4aQNXPUEXUqXIap3CYgfz
         +ZFPCtnhjNgmzAQuB5UyZXsjBM838dP+xEqUkEcZZtTAtQOsTkdm4kNVxLX4D4DIRrJz
         vGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322275; x=1783927075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igICK0R27GpLPcIWvWOd3R2LYyz/6HRilPooukJ/QS4=;
        b=rY//Z3uly3Aei39Cmjo293Av72dgNdhGmatUFBzylwmfd5NJR8udWMapY2qDZsBsht
         xeXm4uu5PSnwUayv3XvIzHu2bIhneDBP6YpKlCoCMm2FQUHI32xP+gg89O6/sz8ppJKR
         JrGXpcrFy8vRcYNKJkhUYM/5QV4tT2DbMjI1DRRn941nPchUE/g6EJBpP8OnFooocyVL
         rQz+9V7Mu+8wncvWJmCz7Uj8/xmqtSDgL9b/Ln7foacUt9tJfQuv3mOGFqDqIcs5MR/A
         w6aGa1JtKO3YGywknfQuNXOME85ka4/lykeFsu/Vj3UARmiUaJ5PhH7N95UAPXFfSBFd
         FHyw==
X-Gm-Message-State: AOJu0YxlY3DlLMyQLJ7HS+u3Gu2FfHQiQVYzl7rk068mFx97XcLP+8ZI
	fqMcE/vbX30L8jeM6sk2W3BzFgjhl4RIQvkcC+eRksDW5gj2Dtd9wcZQ1a8m8ZVkEbgCGZ0YfBo
	KbAm7Nic2YQq5CjeA1NdTNZtOA4w1gac+zpM24OVzKK6G+CmGyx9EuHhY/dKlqDF2seMy/Ykf5i
	/LKcw=
X-Gm-Gg: AfdE7ckcLe58IiJ3WWneebv/UaT8QZ4GjoULgcwiFfqSWLyHmJSRXKnoGdCQ3qDR6+h
	BHV4Dm+V2zmu0cMfaLm8GalZy4+/d9JWV/p59Fuvcz1FUn08K54bSPlWUgq19+5Uh/93NqlDQOB
	0gl+oFTZH0BKoNsnp+wUrlF30eK4myExWc04tp4YRhZ0sDJVD8S6MskPXd/gV2B3SRFg4FJIBvL
	lJYDDiUxFedWX2Ffi1MMNGpsbhBADAcNq1egxhXQzk8ZTM0ifus6z3rHo8U1bRoRvm7zCIUCJEw
	uLwMQd5lSpzzGxR9I7hyVh1YW9qjrI2c5N9nhWTneWOz/GSAbu+fqBD2MPKo6GOpP1tJT9GETi2
	MxSyX6ZeuLQ4v96bUXXS7FPg/ZAEUikrfLlbeX7kT
X-Received: by 2002:a05:620a:4515:b0:92b:67e6:8ac4 with SMTP id af79cd13be357-92e9a516999mr1258196585a.62.1783322270419;
        Mon, 06 Jul 2026 00:17:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:92b:67e6:8ac4 with SMTP id af79cd13be357-92e9a516999mr1258193685a.62.1783322269964;
        Mon, 06 Jul 2026 00:17:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm322064695e9.2.2026.07.06.00.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:17:48 -0700 (PDT)
Message-ID: <e808020b-be1b-43fb-8d24-c4617042d984@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:17:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
 <20260706071005.D18571F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706071005.D18571F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX+sE1LjM9MFUH
 ICvCmHfk6d3Ovkp8aT4DnjE2FhzVgi/VP4yZw/iVlGraC05+HtUnraXSs7GbFX/Xcr1ggEIyYR/
 SBzg46aSiZnEj+tRID+vEo+34MiVMgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX7hX8qfJP4NS5
 rdQBP4VFDJIEBx5cYHa0ZwmcOyK5+PddqEucbJmU8/Vrtp83MSD+u+fMU9SlvfbzMpETShivG3o
 VNNtu4SbhtlA5o9+URFhqNDzvGujUfMnLOkSJXNIDWYokOnXxOKr0Yt+O98nBsvN9Xe5UXfRLT0
 wcnXC6iXKm5sAc0kmUu+jXyNJOWU+Y5wHBqjECf9+Km5cgfuNBr3q6EkoIgr0asZDaIhwlKTXN0
 stpXyFgVOnYSgIPIAmO5hO0frAy6JsJ1iRo0LcO/p9IgqCl8oAOgPp26vXYi8HnofkR348TKJJO
 MfY13jfyZz09gxoYLiLKYWGcG3lP55YBZuwR5X2h3dfSbAWMZH2vlabAj4Al6NWdTUqoaPdaK7Y
 qCE+ONUpQJBNRdCWZdO12EYuUL9904Vu/i4loMV6/dsedKMIvVdFxynNQSceA9lgMZHZaxyJ2UI
 Wm2pLZSMIZkCfsqjnrg==
X-Proofpoint-GUID: 3wyJcYMBjPAHcDGN9zzrMmtVaIoF0ZNF
X-Proofpoint-ORIG-GUID: 3wyJcYMBjPAHcDGN9zzrMmtVaIoF0ZNF
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b56a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060071

On 06/07/2026 09:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Renaming the `splash_region` node to `splash` violates an explicit bootloader ABI, breaking continuous splash screen and display handover.

ack

> - [Medium] The commit modifies node names beyond simply replacing underscores with hyphens, introducing a mismatch between the commit message and the actual changes.

No.

Best regards,
Krzysztof
