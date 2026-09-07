Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21A46F4A3
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786592; cv=none; b=FQf0/ExQWDVqkyiw3QCii2ZZFsemLfj9QdAe79SIywoFDGRvMh5qbE3p7kwe3mIKxrSFoizNp2r/whcCNvOCDM/EyEubO6nj5uD87e9PjHxD+PahvhlwcUwnCmVRSz655fUzGqG1gVfVL5QvBQrNeMjPIb3HinedZZAbmZ/s4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786592; c=relaxed/simple;
	bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ipvwj47SA6kCCQxeuI5VHFqncqx8r0hSYR88QN9B1CakBN2K/o36/6/lopzhYkCweFVLYdGruPw+6w6lQgQlQvyE6aMFsUibDj83tgGe/vgD/TbuSzN3FZeN6l6LyF6COYgt5uKNFqRRIyKgGevfctulvPt4y5+M6OLktV1MAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIZa9HO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxxPJ7TN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIZa9HO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxxPJ7TN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvSiU496319
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 13:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=; b=IIZa9HO/AslX4dPj
	QRCBxEXExnjgwe82EyKstxIA984E62m0JBfn/uZsSgohFyZBJJ05eY8w6GZc9iSD
	UIfBrIfqjWyMG+wQphMs6oWh+g4vYcYZzWxWXjsojdvLK9wQ9UsIPuHdPsZ1ESCk
	aOYcGPEuTP609d9hlUZ5J7P0MPyUoIXF+6EV1Oq76N3WA1OEZ/JO19u4CNyMGcZO
	uwg1LBe1P3ddelUu+sbXwCdSD4bvOw4KsdhBCAuMVczzCT64MQs4PSPOPVABMGyi
	B5pQPOOiBLt6w0q7BtzKNpbX1q3Tdbpla20sZxHqsjPw9Ub9eSSaIZHzlhHGH5Yq
	xqBjdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8ehn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 13:09:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so644349485a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786583; x=1789391383; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
        b=AxxPJ7TNLG453RW07xw5tzElZiWIA3ExHOCb/A0mlQMe1bgkvGAwlwx/r5bqTHhZpI
         SN7l045RmZRYWYhIiOm//ScaZkw5TdkFGcFH4cm0mLdUfmMKSBxzV9GYOekcKB5Jsf1X
         LXAqSJr/djjhUxHWm0YaO5ewwLQb3AqwH+0Jm9TLBzVmfp4hd5cx6gu95h4YofL+SDb8
         6VbRn/K8+GamMVdAhUBamX99Hir917tb6Uu9gIHgOecG2l81/Y2MG5TWWQedns/W3q7H
         phSQIHYgdenYPlbAa4q42yrynBtgHhGhSqgXhUVO4HEMhqwrdXgXnccPC5+yMa0j0eeX
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786583; x=1789391383;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNY16aTxImYRYoULW+frsYnukMaZAxoXQCFZMgYWNiw=;
        b=r6o3FGKdVbh8V7rm5DkEEVZ5IUkmu2AWekFaRLoseze6Kl7Q9aGv8EDajmWePj2pO3
         Wwl1lfO9Sb0ymsi3aVPRts29Z1ZFr11B+wi9kHHCNhfUUVmzDWSnwwLduC1pOwwuX2Yd
         7vNUZqJoWmwAmKFg6ylZvTnWhxmOAVIhd2A7bp03BJJCZUyY2kmOMcl5W/wDQdwFlohx
         7eG7XN7cGYejNQqp8LUgEEOt3FYLwTHbr4pg4k86hA/mZ3QnPkUd3nlH3EgQSmPeyOXK
         OQPDuezAVt4MJtG3+q2CvWcctiqQLqq7iweemiRXkACobg1Iy8t4vQ5XGdivLAa/MXf8
         ur+Q==
X-Gm-Message-State: AFuF++k4XpNyQJaqR5493OpJoyBX1burwreS+00VluH7t4hI13I2dVlg
	mKI8JZaW2bsGRE01t496bCIFo378ftpRJ16RyTpa0U4ib1/zKaoIvfuZLgtsPvjyVqPSKDtL5H/
	mjMD9YlJn93NcPNBvAQn0OtGXKtyaMgMRGg6iue7V/22z9cZcsbG15532BmEzKIG+B5iSe5dSwp
	QjsNo=
X-Gm-Gg: AYBFou2EtWOOQCMblDj7mVUtqsHlUJepf5SXPMrcDp5q/aVaKHyknuD015EuL2vwLkd
	gnTNW0HGSwETnh4kXyRdA5BD2I+jFRP43xonjwm/XkVInGqWym09ZGXqjhCsTFmuFRp8xSKxoiV
	RtmHEbG2RGulkoK3G4Wc0ESl9TtNjcCss7abuIeEi5m5H0RSnj+1TWnDu7145xs72UhKKLZWK2N
	D0j4+JCXgByBtXoYTK0U/Xlvcfo1GdUt67WAKT05svi/7hfH8W0IJS8iwkZmxCC5U1QnDEpAwYj
	kfJM657EbTox32VpC/UCUDYBPFFp8OfYFwCZRpEqKC6MUBEHSN/x+PdG7KO6rcv27aDU0HU1OsC
	pFbLImwtjyB2WApSLL8vY8E73n5hj
X-Received: by 2002:a05:620a:2903:b0:939:7c8:78a9 with SMTP id af79cd13be357-939802f31c7mr2492763685a.3.1788786582801;
        Mon, 07 Sep 2026 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2903:b0:939:7c8:78a9 with SMTP id af79cd13be357-939802f31c7mr2492750785a.3.1788786582247;
        Mon, 07 Sep 2026 06:09:42 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm208565105e9.10.2026.09.07.06.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:09:41 -0700 (PDT)
Message-ID: <97cc74e7-724b-45a0-a839-758c6fb383e8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:09:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 09/12] drm/msm/hdmi: Add HDMI for Eliza
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org,
        conor+dt@kernel.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-9-67843277de17@oss.qualcomm.com>
 <20260828142220.AB61C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828142220.AB61C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX+0amvF+BsCv0
 6zHzYM6M8mmNwg/+inbV+JUNkSxQq8u08cLfPjI3jCj3jldL+KEOlUttUAs+NFr9iabqxutHGt/
 X1EooTNjxxisbEOfjtvuVi9h+9kgn64=
X-Proofpoint-GUID: GA59WlWxphOOmOZ1q9kQJUsce76FTRFH
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb797 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GA59WlWxphOOmOZ1q9kQJUsce76FTRFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfXwCSjNN8xN6Qv
 E/Xu1J3ctH2dg8NFOdLApz/l465ZTz7WffaK5ku+hRuruQGR6d8t059JM2sii6PFyfDO84a4pss
 TW0ezg9QUN8nf31+JKX4Hhbe2btIEHvXwUEoU/o5Vfrn/KcudU65xXHN2AsQ4iYL83PKTdqX0t0
 LNq+AyM76O20+3qeZ32vJzcLBYLlkJT+oAfq8YFvASfSVsHFStGgYlpcrCTFogvRYW4TJ6aCvue
 /Rr3gcOodHZISqcILY1LayJRB9LiIQKZcq1OJ2Z/AtF30A6HV2qCXheXsOLpGofpbf+eJlXcmC9
 0gQqkgP1uQNehZ6E8mvNQHhM/Evy1L0ZQog5L3v+uWRWwg+5jBssxQTEnG3cPwSDuEwHxyzPPjI
 X91jGCvtObwy9w/B5gp0esE5cCqtQI3v8KtLzV4FoiSStEvm4qYbVOFIZC4ZJt9N6vHKWmrBWxC
 bXnLuHf/2g2VTN+W2NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070144

On 28/08/2026 16:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The TMDS rate validation for platforms with OPP tables accepts inexact pixel clocks by skipping clock synthesizability checks.
> --

ack

Best regards,
Krzysztof
