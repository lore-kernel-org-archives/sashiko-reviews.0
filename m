Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484649;
	b=3EO/COCkJMsWQN0Xt+BP50QrEwOqzmHu2iz4dJRdZ0ssZWHan5SjNnaxy3HbjEmRtoT7
	 AzyRC+EFzgQdnRRdohFEYSaaIK/38Hjm7oQ+TlgHTcH79mFR1mc1tOsS7kA8qqqwnRqHN
	 701kkJ3+E6xiuYRyEhlEbdTbRWWnoY14qpNkE1rF9AT+I+dft7eFExrReDBZypJVGV7ES
	 blrYI+lOadcucIdERo0ZX75M+4aGNZQgwCpXjs2p1mwaPAUUcKIhurDcrxFpii3VrhdUq
	 5TxO/YaNSOFlZZjOLyK+PVTluCvhl6y3sDM5rSSPY5XhLNnGcH/RwaBva/M2u+JAK7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
	b=cKtvFT0gLgT/hBNkqXbiZ0UWjjZswbqMYr0zwPKdEDQw2tlVkZlYv51TlbLzFfClZMum
	 XsC+TrtPiUPJf0Qz3VcynMijIjsAl/MfwaUK/TcTEtM6/gS6b7Yz5pWeo+xFJn45TtXgo
	 dhLt0brWcOzOUqbbOK4tX4HrH936HNhGWdUdoPlfSjjC66Y9WQ1GTFWUobw5/fWRrAggg
	 9kr2EQ+JtKn9aWOXUjM0t4erYuXSv7qyzvYMKKElSbO/9CoKzoIZJc2Tts+H9G+s8/rF6
	 QW55nn53VLkWJBI6ZZpk9NhwrE4Y5chc5Ufn5/YfoIqOfZkfqPgUGHDf1xucreYf6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Gkc/bAi2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5A8cO9W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C7606A32A
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gkc/bAi2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5A8cO9W
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBf9bY442019
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=; b=Gkc/bAi2rhAAuIjI
	q0KHMXMnAZViXImWfEbIOd2boB17rtebnyaxvXCDv/i3i20Knxqe9SwP8jGCIIC/
	L0AQm5TgyXWQwIZvH6r34FRLim3OfYfspv3fv4DHq1hPtXRB/6q8IUbEZF3gbxaO
	KXVXlutsiZRuGzbJWnoVVy1IpqmG4kqd+QkaQeNYt50A+lsvYp5ytRqcxBc3cGCs
	BXjK01zwgnjVKf25t+1pp9eqkY0oEzFVoD8Z3x7q15ekXVvbzs8jctIzK7+Hn2HY
	negOhAJMISYFp3nGmSIUTEzUvi2Mj1RBOgOsu2ac7bmvLsX2IHHcQ2x10DXBdRKm
	yyGqxg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1ak4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:57:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d304016194so2145220137.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484647; x=1795089447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
        b=E5A8cO9WPs5tU4FqEm+P2jqPUS1/x/mcKMSHPiZ/xD6J97HoHPU/bRZCzJRXOeGNqc
         KUYyM4+uXqNImdVG1xEJPl2bpfdQSUPo9QmIBLMaTVJHTw6fFApp0k3RDL0RI9LU0oIj
         Ib4DHjSne2CGMybwWipT1chPXv/LHF/lTYQQJU4vCp/5p/bMxbgbl+XS2/f+RtAMjGLd
         7Az91NS6PbOSQmVzEN2WiDRs6TPHFdS8aiCOlgHvjNplqYiyRdIALm7v8G+1E81dLzo1
         nSmgpAuYtxvSj/XijH3NNG+n9krJ1j2tWtMikPrUDaO2iiduJcp0HoFofwetK7RV9Ku9
         vkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484647; x=1795089447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phDGNSgmFZ1B4vgdU5AZJGhe7zrY5TWGYjMgI8jjneo=;
        b=prkn+1jtrEJ4kIdS86Jl8H1xNlrkP8j0DHAw10IZwYzTfmngbVGeUayUsxSqPtGP5B
         dt9N82Ce5TddAR2OYl3qBza4MbaGuhBH1rcLfsE4MWfLlGguWE2thZ4YWJCkzy5uH5zE
         VEx/DrM2T1A1IWfVZ6LptcKgKWoItK6YqTlwPPcQGuacsAWpmk8Uz+JaVxXVMlwMpgLi
         RiXy7WEfQivbuqtGV3qRobForqg6OGP8oYR1A5pE6CgU/uuQbvmrcDJE+luz9uXFXhrv
         IuiXdg+DLA0lIgvOxOr5Z1yMT9xm989GhlgdWSr3TuBS2SyDcMBc+FtZdkj+gCNCyQmo
         KUCA==
X-Gm-Message-State: APuU4Z+QXSJfbXpGnjlOs+MMbzULR+asepucWjagd00QhWQzHXLLq6N/
	myy7ebjGGiHw6bmZZdI82rdH1fdrFRT3CTOdPbiU4zQaYG+B9Vv2NSgYXfBIDpPmvO9wKNPnKXT
	nyjm1kYOQHfU+r1g/Av+rI9H5e+zFkyMbHtqKWWQuNczpXp3F6KzK66P4TADRPlBUBGA9enkuZz
	4+vdU=
X-Gm-Gg: AYBFou1eDFjldiDXbJR+h32b4ov7AA7MfKNybSSREvS8WNBj/ogtFGSO+WG1FQHzNZE
	qYrPqbj4nplcr0Ehj0mZrI5IYKyWO7Ll+gR7Ew0TRF25bEYvs6+Rtji/31KlHGKF0CjM1Mn3CVB
	DZ+WmTesHmxlKgLPCwkaSPoZWQONlHeg0mvaQMivj2jiiUVs+XsXD8P6wWcOjzM3tOEZYJbM8kP
	LtrTlo+aDD3VJx1LwWMD5IPPkelEwtYuKBOMxr3+KQrp6tAUzLRs1T6Fu19hDTQZyEbmB1b68b5
	KUvkVvqQfIsaQF8IRVBYdW3y6xCdswjf8NCbZG/ZxfYNozODbV9TEN7TDsULpJLUo9cxHhisENQ
	9EYjImMkBJHzYkVkJnC18YO+IK8kQzxMom/6CjS+Hn5WHj//ohq8x7fzidi+v12gtl6P/1IquVJ
	s=
X-Received: by 2002:a05:6102:3585:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d4eff7be7dmr2317054137.3.1794484647193;
        Thu, 12 Nov 2026 03:57:27 -0800 (PST)
X-Received: by 2002:a05:6102:3585:b0:7c3:2f13:d905 with SMTP id ada2fe7eead31-7d4eff7be7dmr2317050137.3.1794484646780;
        Thu, 12 Nov 2026 03:57:26 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm58369565e9.10.2026.11.12.03.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:57:25 -0800 (PST)
Message-ID: <13b50054-68c2-4c04-b895-b4846e0eb285@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:57:23 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing
 enable-gpio in PCI
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-201975@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-201975@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k3zVdVzZqyObxL3uecK5tb0a1--ntQAu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX03+5UNUj1FZ3
 WJHkZwZyTWYAiJ9Oor2+ZTbXwawZib9GF1a/eHY0q/bGsphPbfUXFnznTStlLb06TFj+Jid4fPb
 E73LvHjW/QwyzeJPEWQADLKN2hZJaJo=
X-Proofpoint-GUID: k3zVdVzZqyObxL3uecK5tb0a1--ntQAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2NDwbODMpj5P
 PITmIjq8K/e7KqCW6hERJKO1n6xQgV5KtBdkkBQxsXJxc1YqmM4Qs83lypiJ5c61jWX/9vjnvin
 0/whAefXaV9KuDNsAt6iDNsk7Ihr8qxdL6RICZ1Hvy5qdqrTtquueSQvtnGHewspzaCTvW8aXL1
 vLAe7ZB+pxeaRThh86ueOUCih0RbGwPJbJwav0dVB/Qp6jWwxsLtstNxRQ3CigFv3MYnLFu+PlC
 SIzOHjNsyBPHtHNqG58LwGPGTyO7xEn9PSgUJQVSpAHaT7JOfpNvk7gTfWYfnYyfdAKVr1pKgHU
 u3aXsxir6nVG2/1+zUriC0oXsF58jsK8BwgnsDWPeDuUpQvKW5lTr3HXrRFKZTRYDW58pby/nOe
 HvXNGzOfzEDo/QHM+w4cKuGE5y5ihIyPPsUjCT3JJpI9WSkLn5O+GW/vemzFFKwrTWu/B/MC8sc
 Ig6/pyPFlOriVaCRLqA==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5a9a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EtXGP54Q8iIVWt6SxLwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

On 06/11/2026 18:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8150: pcie1 enable-gpio dropped instead
>   of wake-gpios
> - [Low] arm64: dts: qcom: sm8150: missing Fixes trailer for commit
>   a1c86c680533

Ack


Best regards,
Krzysztof
