Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879C412294
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433384; cv=none; b=MJdrwLshQxeTmcZ29iXyxp1d65cLjN9b13mht4CNV3pF46roe4ocYEil+Y3fKV7I8xg9A1G9NcBJ4DG/sw02RyKFebtmHleVbF/KVmft2BTiScIKRAaXjcYlXxyLS1yzpdxQptoUP/bViKwdNnBT6Le6ORuHdIDVjNyd5BxXU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433384; c=relaxed/simple;
	bh=CrS7dfh8VoX5AtGoISGosKA0+Y3IZxb5P0ICAJUvtHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=de5y4VWJI3yv79T1sBdhit5RnvY7XoRKuPn+5K+GUeyWZfIkGDuhqvf7l9JQ85uTjLzlmdThmTZibKXU1NrTO+9EscfjWipqY2Oe+V+teNZ1EHNFvgAfbkVrfuXvPewSMXBoWM7xgQsfDUa6+6un5VyM1V2jey1RE53IDUl5G38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGOhIpdz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQGAmdT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGOhIpdz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQGAmdT5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMRD055453
	for <sashiko-reviews@lists.linux.dev>; Thu, 3 Sep 2026 11:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrS7dfh8VoX5AtGoISGosKA0+Y3IZxb5P0ICAJUvtHs=; b=aGOhIpdzvRQAqchU
	uG9DfyXvtVH98FaRuHRzZWhEO1VCYLDh563aE6VeoMTiMJSvWFyMvYKS8MLNngnW
	OlokO+amiETSFus8MJ6UtAYU9ljWwHg3SGUqTICF0Dx2jE9hJySSCApA1zfYT7aA
	CwHS/qIJ5X6gaDBiQ7ONxHwOaJaShf1wiSwHl+yn9nq+MHP1f5YhoLc1Xkj0/nK1
	RMPvixn5WIY+282rMOm7E7+FWprt9+0rWOGIdJ/IeVTyXvGW/eLzjhqsEHiBDLJU
	tMZHNZL0W97lfKZCX9Qw5huVToQA2sS6XzlPP9tCoIOz0q1366izrhK1n/K3e8tx
	jMTq9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvk5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 11:03:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso434587285a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 04:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433381; x=1789038181; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrS7dfh8VoX5AtGoISGosKA0+Y3IZxb5P0ICAJUvtHs=;
        b=XQGAmdT52nKugyzWmChVO3LN4Axnfe4nivxi+6GbRufs7DSHv05uQjtqlt3tHS87vd
         5jpH6UZzuIgrAiLnHcGKf/aNKKQMMyy7IbeXtqt/p/eaQZmL4uNz0lI2JQYfGM9si9Kg
         bpv3spgeG+UA1rCiX+wAHjmyOfSCM3XtW9pgjbEP/6fiClyM4ms4M59qjg/7mzyYDb/Z
         Qj2+228menGcsnjoB2IrqiCyTA5O34HQqIIvqMGAo7d1O5v/tvDrpiZ5N4yvEFrud8S3
         /9cQXKm5oJi0IPyAuZbrKfuhDZKKfUJDVBNCUEcQE81KoBM+zL6zVqs3yhHW9Lx21T4V
         z3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433381; x=1789038181;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrS7dfh8VoX5AtGoISGosKA0+Y3IZxb5P0ICAJUvtHs=;
        b=Su9kbNeyqSt2+FpjchZC8cA+M4zfecs8/b3RFwYhY39bittCiGrQtAJtnPNU1Xge/F
         PCcgpwBJU/Fy6vbv0ZIxNHU0IBjwj4FWQLo4t06OLdHrXVlePknrh2i/p/tXAq8gFoxg
         JTrylDjnNSpssqnBr5xGD9nK2v7vmFlH7cAvyhurmb92LE+FtEX2w0dzBsXqob69pKbk
         711KUcg2Fy44555C3Gb8EiMJrVfK6XM/wx9S7YHSQYqQwIkzxYrkmaWLbkpxWdClJzNl
         jY0OeNkP9OiKmie1ESh6zWW7LE0EDtKne6tGTCGnySLQd9t/F8Yoj0NIf0ROx0lET9wk
         tTkA==
X-Gm-Message-State: AFuF++kFDuiFOPMKzQZaSrs56SPrtREc96gmkamIiOySHOhB/UaggUh6
	Ux5aN9903bsj8/DbC//cPVkEZcO4Z5utuoSMvvQlgTFU6VKg9kNZ1A6TUQt58MqgmHAYq1XdRf2
	1DNVHREzVV4sVQ2DDFrcEAn8HJ7KYUyymO27QbvslGMRsufcTWxbDGBt8ChH17K6DdDSHVsg4G6
	wofEs=
X-Gm-Gg: AYBFou1YRUrrh6JyuNoNfzDNq3DVnlKUUH7GQKlcJM5YV5TGSvZDO9YkvsWmNXsCWVL
	KX5/hkTlaHctINqYBgktId63y9aaPyD5UGhitHQu1DgdndZAK2yg5P7h9dwarKdr648vkf/52oO
	+ReOpQ1p0nrerf6Pzp8aVTakfiUP30mgUPCKmWxJjVeFh7Zuo8rz56dEhAjCwra8j0AP/iUbo0C
	3zQsNpJ2PMZnHFKEo5ymjtXttM6k2S/wkR7/ZCQ6Pke4FFBzZuh+JwH9oH9oOsf7nM6vtldNDuY
	01gwCkAhY8dknf3EjVAgG2Y3dAiJ0GFH7tzYX0mJEW4weq2L7AMRTiP6zVEE05I2+h/i9N0HA2e
	Vk9Krw1+JlWJ0rVqzprIyNGm43oMQ
X-Received: by 2002:a05:620a:ec4:b0:939:6df9:6547 with SMTP id af79cd13be357-9396df968e6mr417343885a.51.1788433380878;
        Thu, 03 Sep 2026 04:03:00 -0700 (PDT)
X-Received: by 2002:a05:620a:ec4:b0:939:6df9:6547 with SMTP id af79cd13be357-9396df968e6mr417336785a.51.1788433380378;
        Thu, 03 Sep 2026 04:03:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm12046355f8f.19.2026.09.03.04.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:02:59 -0700 (PDT)
Message-ID: <de3e9d23-c55f-497c-9d82-caca692d2f66@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:02:57 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: Fix setting completely bogus rate for byte
 clock
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260903105241.41C2A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260903105241.41C2A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9953e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=rgpvN1PqdaeCXe83_U4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S0wHIdl-3SZsEaFcMeJkthf0o3VSKeRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX9vGrnKyHFkr3
 jh2j3ZQ8lcXJr57fjDoAI/5eA65HtANtAF5CsYkysy0HEW6gJJU+S4f+ZDJ+cXrLwu92QwUGThy
 s+WSP22NjFoNZkszBSyvKW8DKlnnqVv+5mwf076QMAtMeLPyBJW/IZoLGAOZCTXXSRUCjH2xeym
 S3Ne/U3yQUpgcpUkDncFT7afAFY05e3Ot9pVkiZ0y9j2Z2bamSo5eVsvSusgpn5MVPJtgZYBcca
 SJDi4g7b3KZqHWMgTW9uF5lMhuNMa2jdEgSdRAt634zCo9EIA4wory5j1lNUdyuUNCrBqnNvr3A
 NBLQskY7Hit/rQg8YqOiCd1aa4RS5T+DoFqi9I4JSLAn+kIsiqlGQPD+tGqTY0c4kJO77rHA+Ih
 C8JHrQrslPb+rbhtUg7/fBAh3d7VQKjww9BCg5Ub/UpxlU2BYnPfxM6SbRa642dxbH1Wnc+NO04
 GIRRg87uLwbiJ3QL7lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfXyAYM7ue8ppBv
 LPgsD9oXFMeUdj7rsc6GtdEBIepTGoQvQfYUU1senuSxlNN2VbUSlaSrTY4uq/Xx/ZkILrlhShS
 cTJAZXTDpcQjovCaVy/MZoWRlJVVUBA=
X-Proofpoint-ORIG-GUID: S0wHIdl-3SZsEaFcMeJkthf0o3VSKeRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 03/09/2026 12:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Reverting commit 6cd33b6f4155 directly reintroduces a panel scanout glitch on MSM8916 and similar older platforms during runtime DCS commands.

Obviously. The problem should be fixed other way, not by introducing
incorrect clock rate rounding breaking other platforms.

That commit introduced regression so it gets reverted till authors come
with proper solution, for example.


Best regards,
Krzysztof
