Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BC344D81
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 19:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304816; cv=none; b=aHk32r2yUW4Z41YfY3P7UizSfR/xTux+biiMBvraBiz6Uha8N8fFZQC27t6ssQoSilA18uwzZVV9ySdWWAux4MhQL/ITAfIlQLQ2sJSSP5w2ONLA57LVrlE7h2tduQZmgnUcKa1uJ/AFPUx7xDz3wbfNZjmGjsRjMRfG26683eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304816; c=relaxed/simple;
	bh=qa6+Eq6ywhjy1RaYO2MeVgoTr/wcu9OhO6BnZE8WvQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXctCNKVkAtSLTjE/ly1KOmMf14gcLM5LnE39v7XvfOoEFpYikH7llNGs/WUVcwTS+tEevLlu9M9mqUfcLbGq/eV9PnhnuwZ04RqRxqZUi5KYN+gKjFQ4avDlpxNFpYUU/ctsBUwpyc3khEz2GffvqSC98avpxYdltRFlAG/DWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VldpI+mu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTxZ4cpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VldpI+mu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTxZ4cpn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2KTk826523
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 19:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=; b=VldpI+muLBHRlOYV
	GMg2X2/4sOgAw5yJdp4ncDbTIih4aUVsX5UG5vy3rXCMICZKdtzDKl0YpV1LQLDg
	Xj81jfb9By5PE3ZoXtdLhiGS+0Q8PEOu7rI05fG/Ed/NePsAm24fL2seQjr2COuM
	quJup8MV57vGS86ZNc2kEmaURDadLFxe9mVH2mU8L8pVycAqhQalktyQ2GlTwX0I
	+akZfaU+4KFaezwcSJKRp/Z5YMpjFUWYgeg8k2vF4aOulJv8PgivfBRFfssDDjDT
	uR2UM9KrRIph9wdBNNeocL6qQOcOVu8DUvWXEYO6b9MfbDWCI0t9f1c5eTzP7GpW
	R5oxxg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecahdnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 19:20:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6329c1a6710so3273226137.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779304813; x=1779909613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=;
        b=kTxZ4cpnDifademAlae94anZt/Q2Lbv16CrAt2gEzhnUvpyiYHQfM/rk71pGxBeHmw
         oG63eWpjfNsXXvJabrHbkPjfNfHOYht5Jxa1EEox87V1Vb6cAk1q/VSm/PeHo3FCujp/
         pTdiNFyAjOwEXtRCbCHDjDGok8EkBR6lcIAzsfoVLSytsD11KnkJBLKYvhr3fNBdCBnr
         DnWxMRcTz6fDuL5EJMaaTbIJA7WvGSGlLaoNxmT8ZJGoTwb2I3l3cGO9pw9bkQJiXkLJ
         bLeFfnE2wfl7UVsc4mw5LzTv0fyEHd/i51s1wl+KFI+WtWC8GOJ9gOWffeymBa5Ck9pr
         ZHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779304813; x=1779909613;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/jyzG/ZAC8KIXqiPNpp29r/OrayvB6GEHbVuvdxf0Q=;
        b=hCK3U9+0Fg22ZajsjnNtrZhaQBKgRcGAJd0u8j6H+h6p1E+ppvupeWpSobcuaLKaEb
         pWKvLnUY1wPZUzS0rrUHdUUqlzS77DBxrhfyt7yuUGs5JzIke6lO/Hw1rNW+ZctZ9uc8
         8S11EKNDcYsEgl4c5cwEp3gd7J3eEwJNzKLuJJfa76XguRmqpCMO0HVoKgOSMulkPhev
         /c7rWvwauh9ySUQpl0DvYphj3wl/YfZFg43ZM7t51sy1yE/B5Iy45ta+J3aqAcxeZhDN
         l8VUIdIYg55Eqs3d4trlaZcJqNfEtvHTBuQgEwAusfovqh1ZgzgtC7wrZjGL0FvCKh8n
         7xdQ==
X-Gm-Message-State: AOJu0YwpPh0AFguR85xwDbgf9QTObSPcWDGyZst1rGRI8AUZa6XduTRk
	XZcIxzg4+uuc9NZvutxG4VJE7K6mLogPg2IGFygvSd/hRUj2FbAECko1nZps79yoTxUv3YeWCIX
	8tYQN/o4Ac3CPSC8Gl+L2SJBMjH2uK2kC8g6O9rSlOx+33JOt90/ZtJBuE8PBTkjllvjN+raeCH
	0OMyk=
X-Gm-Gg: Acq92OGt4Isb2SOCGcVTbVrSK3Ry1E5kOYL6q6E2SgSI+6qJdD2oc6naBHyM05GIug6
	rQLq3XB3zqX7aI3/jwCk1bYjN6w5kmSEgp2xomnRHJvTlXY2AWRVhKdNq7ZXb5ixS5cIuJNC9BJ
	AKf9VMJmYWzf+zXVTurICB25q8/OlU0Fy1haRGcIQt4y6Ad2scDRhJH9FxxMyn8hRs+2793PoSp
	HcRi81aHDJyZuBCd+qamIpOQWJnb362aK9AJ/AVVv6Rfwq7x+UGbwIF2GXH+Uf3LW+cWLTNs5ym
	UM8SKiMIQ3ZQqZox2122RWupmmbSbGmo6Ccn8mJtS9QQVPu84ZU4u/adoGcS6O0vcohiR6mDcls
	c44oK6IEEhB4pKftQ8rE9WoZEoXucBIKC6e6Plb/ScM4CXBCN
X-Received: by 2002:a05:6102:4b8a:b0:631:487a:23ab with SMTP id ada2fe7eead31-63a3cc0b924mr14710587137.5.1779304813521;
        Wed, 20 May 2026 12:20:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4b8a:b0:631:487a:23ab with SMTP id ada2fe7eead31-63a3cc0b924mr14710578137.5.1779304813106;
        Wed, 20 May 2026 12:20:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm57065016f8f.21.2026.05.20.12.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:20:12 -0700 (PDT)
Message-ID: <c8011903-1d6f-4f17-9efa-f3567f556029@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:20:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] interconnect: qcom: x1e80100: Revert ABI break
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260520184944.182148-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260520190807.509871F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260520190807.509871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t4o54KIMCr5yq-bav3q3ywkf94VjgWFW
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0e096e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=wspJ9bN9QRu-DSE6Ws4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE4OSBTYWx0ZWRfX9uHKwD1Iad97
 T5+gssEo2GqA2hW7IE7/C0ViVO6S2vAoxnX+YjmIq/t7l+zg/M4z0hDv7m5F2iWLrYpdZD76+Tx
 plPMbxjj3tfUo2wB0L4+JEJE9yo+kkOAcqRgvFq5zwdgPYgmJvfd487IJkpupCphLvOMIej3KtK
 Zp4dfVBbAn1Zx8wQzQQFviqU0nXppAdJEVRppZXoBlYxlxoOK0Hu3gNcPh7YEEyxZXzir1eT29d
 7KV1xBl0mf0EHcqNi0jpgl9oVA/phPhyuGm44D6TrK4ctdkkwvjAi4zU13leBtrdVx8vJHmje7B
 rJtYiNVGx4jdZ79XZ7roQMubQPfOqdsnbf2jazdaWwkVS72LxV1uKGVrjNflVj2ZODb7CeYC8Yg
 Ltx6ESm5JDEpBR1uY3P7rS5sLRXwAJO2VvE0lKp2QGBmX2oP/7j4GNG0Rw4Xb8LremTVkhLxwgh
 Rx5izO/qCwaAiTITQ6Q==
X-Proofpoint-ORIG-GUID: t4o54KIMCr5yq-bav3q3ywkf94VjgWFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200189

On 20/05/2026 21:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Returning directly on `-EPROBE_DEFER` during QoS clock initialization bypasses node cleanup, leaking nodes and causing a Use-After-Free on probe retry.

Pre-existing issue, I'll fix it.

Best regards,
Krzysztof
