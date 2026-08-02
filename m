Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F123394E
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673332; cv=none; b=Dqz/Z1OrE1CTvNtnYcsQW2Ya/mx22lRkOSAaScyQG6cWdiSqC9X9xAN3a4qp8YtupetUbDnVCGNmOHGYV4AJdZ0w1GgMOFwcrU7LYKXnIPXhIkKUdchpeoa+Dl1CnQuDvpwpKdASdXXSl9KvgzMCu1zgx5uPjh61E6YXNz5D6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673332; c=relaxed/simple;
	bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiBxTiGykFAcwFr1jdKvRKwTQGsLKXeIJpyjzqOLWrqrQjmnR6RfQ9EGQ6oJpMiyLrbB17tz2vuEryUJWePrs2yTdk52wdtnEviJDyINQ4DihQGdnpdyrj41aVJG4yAvmY4NGyiwt+qMZ/LX5tc3Zx4VzaheBKeMnCSqa501ARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3FAJNqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Smtj/ap/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3FAJNqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Smtj/ap/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6Yb81602407
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 12:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=; b=e3FAJNqMwSV9W3fK
	W3yAz8mp6y2b60b3upJZUfKr5DHnAo9/tpyg6VHk+fh4PSg9zPqwKz/XXF5UeyLi
	027CvOxW6VgRMDBatJWIY1dfGNH8NyRjcP/g/t7SIzfxdbMsNhekNleBIIlublMv
	t+tGgtSMSqyQzZqevN10sfaAwCpNMfMVpbl1HK1nLj2uNAehxsRFvdo7IwplhTFF
	1OOpuE4oo82Dj2myi77/RaXIR8lkHjqR+CZneiSDCVMDOu5gUQUv3bTvZ4R0qtqY
	cX582GUg7jdvabTjHfXSgoNQbKaCCI0/5GUZ9NkAA1ZnI/m2xc4E+viWQIfGm2K9
	9+Aquw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtav68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 12:22:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso25044801cf.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673329; x=1786278129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
        b=Smtj/ap/SJPv4FI45c1kpa0Qdu47hfM6B5hSWbhMrdIewU2ikU5ex44JQf0Wh5mvoh
         h36IXBdWi1ZILTrTHPXdwsFitIUod+KX3ys7yXSxw6+DhsAIKPmJUrs36inmsroeYthG
         dDO+DbeRk7FxtOd30yQGXoEJWxKHCXv4yng6oq1kRAZ0iWfQv4L7jQFsKi3LspqdUC8V
         GGbVykJRvQJ+UQlI00NrnxK53NOzxC4Sgk2nHZEyf15nmb5YqES8nflWrlysLH/QRjrD
         04csvbl/xkd3AzjBnIZQducG12kSwA8ZVuyveAFss7Kd923sCYplL5AWBeE1bqeoNHdO
         4N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673329; x=1786278129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0nDL6EsWOvbfxKiLuZODVM9eG5im/VYJt4qpOrIjFw=;
        b=DEoLzSajGYGN0pJaPJWY3Ai7sDZPGMcOEfZn48/5kdW3w98T7NtrcLR3qdZ6qTvxtl
         8M/BQqvNiyQAvIJz8ZrDJp1tIqqCYKq3SvQUSnwuhaBONMVZr2PpmFVQhAJKtc1GhLhI
         d55i0abaHOGyFPn2mlgg5t2fxvdqyvsBTHz9Vaa8KGeNXcUqjWEjkBV82YzQKPBXhBxl
         O73kheT1v1DfIGY2m4HRL10yh1NUqOMB00oel8PuwTYSeOtvrGt7HW9WWpsOCfGKfBfb
         7wX2BZd4wzdFjbISCgzuiBnZsNQV2FaenYofnlx4y/bYcySZ4mHoCivQMdR7p9a52Vqs
         wyRg==
X-Gm-Message-State: AOJu0YzB4g/QKwEUiQuohO/AigbU8Udb7RJdGo1aF3qW1eSQ6riekOk2
	DOrvmVTA6oY44Pc54bKUzkD5Bv3+28KgkguDFPn/51Bj9ffUgCyVYYyyx1+PnmzAvaq5bMmbymN
	E4dMh2+P6kGE097AiImkY5+yVY8apf3ehMWfGDEBQ3jdzUopgPsfKh6VqRrf0vv0xqLKklR5fh8
	67SSo=
X-Gm-Gg: AR+sD12HO6bSliOdWTifhSFK2pEYJWOb2oXw7XzpLq2xPYIZw2lB5jVI2aPyrzlRQgH
	WODtzdY4guWYWID6rH2Kd8Wc1v6ilAgVZ0ZTit3LWekGBV1lCfSaOIDEd47zvRfXqEiZbysZ8MY
	nyAPVviAhgwnNa+Ipo+TufhIqFinCFyJjO+5zS2RRityEaMeK4vXjTDXvY8DKFVuhhBHyFIfvpj
	S/HyFmjjz+Tdd3Hfb2Q6F9Cjq2gCMGRXXSQknc3GNyzo8uWfyXWo28GYiXPgkaLdC5Iq36L1EJZ
	Ph0dpM6AqxyXvp2HtgtWSrRiW1oOFNC/7mltiCt+GonMKN/fzNxPMngX+AN6jjhbzhWVrQe7jg3
	BpmnHImc1BvBisvmpYANfBDzprXa65w==
X-Received: by 2002:a05:622a:5145:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b566afcc1mr136397451cf.14.1785673329171;
        Sun, 02 Aug 2026 05:22:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:516:d955:ea6 with SMTP id d75a77b69052e-52b566afcc1mr136396801cf.14.1785673328642;
        Sun, 02 Aug 2026 05:22:08 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm24324765f8f.11.2026.08.02.05.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:22:07 -0700 (PDT)
Message-ID: <38dad4bb-c05d-4390-83c7-2cd0e76aaf4b@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:22:05 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-7-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085405.8FEF81F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085405.8FEF81F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX/JIlr2c1OGgJ
 TJcya/HJn+Vc7g+h2zZK0tim5/NnYIm1X6hg099VI5H9NKGg3AHkg/eJ1f/3aFgNWkdtQTHV6c+
 Wk9HYLAFHcE11HzVLLZaWAmpzak4Zz4=
X-Proofpoint-ORIG-GUID: yaZjQlj1cSA_d0J02V3ceMn7FMNh0Sl0
X-Proofpoint-GUID: yaZjQlj1cSA_d0J02V3ceMn7FMNh0Sl0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwOCBTYWx0ZWRfX8yb94I8/vLUV
 ib2mOq7irzBhEFNIb65mar2K4T+FT/F3/TkYh3DQvAsRFus8GxspnQvpqdCKWWB8FnGd7Ow6eZQ
 E2GZpj4o8yyxs4Tvrzf3J740YCC0Ymn+ADp42rqv2FBsAohGlJofNVP66IQyYQQq+jLRM1R0jq2
 8NP7J1KgsAFGv5kqsblDs8/CmIvhR+iEU7mkBjvZFnzuJHzg6aWHupKm2KCPVkMJeOqoH2Vn20W
 /WzIhxooQeLHqCDbhlJltvtJgycQVYqjrFrTTAege5B/LNzc0XSsOfVtCAAotOX+q4/rYMYNHQo
 hMatggO19EpjQ/OH0xQtKOxUvFuZf1ZSlLtYdTqqW2FqCxxT4lVwk75cs9wcEcpNUm6+3LOw0/G
 TMTg9timmAeuxkuNhkvgqQ1NgzyF7iyxPl3cdHZrqMSDlhhGxvp2VhPQu8QHVYT1CBIYJSWbhmI
 c/QIQf4WuOG4vPm1Okg==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6f3671 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020108

On 02/08/2026 10:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Incomplete naming refactoring: the parameter `input_type` in `check_block()` was missed during unification to `file_type`.

Ack

> - [Low] Semantic conflation: the commit overloads the name `file_type` to represent both the exact file extension and the normalized syntax family.

False positive, string is used as the file type


Best regards,
Krzysztof
