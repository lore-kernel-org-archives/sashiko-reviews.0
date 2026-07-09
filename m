Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9164DBD89
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618736; cv=none; b=YJMe+8xOiHKyooN0Nk3yvYJqYg1PLtFyohLJkLjLKVDJabr3J4X/rFOMAnTQwiVC4JqXhMmJfuf4ZgkvBYPb14SHLL56fCHoDDLeSNeG6u5NuX7wHeiskyfMhn528/XoOZWZk1SISjy0sdEQN++Z/FbFzK9aX8+rejGcKTccGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618736; c=relaxed/simple;
	bh=Otj+Ou66K1WiyZij5ow8vaYwP9joE3fwu+rFitiPLkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek1gc+ZQAO3JuT9jubUmILJUFv/mu7ow6x7gxKyBIKww1DghfH56HJdfeRr7yDU+KHiWDWrlmS+ahLvJ8VZx7jRtOfJYKAESBtfvwNGFDtYpaOaYCo4N2rxIG+yxrT8rvIEg3HOExmFPfZmPPMlU2nTpqoKVPe+FEhPSU+0iy8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7BqmBXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ibz7kd92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7BqmBXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ibz7kd92"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXdg72517732
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 17:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Otj+Ou66K1WiyZij5ow8vaYwP9joE3fwu+rFitiPLkI=; b=S7BqmBXknonuus2B
	bokEQyvjHPh3eh0svkg4F6IERNXIZrcQ81wQqJqybU/VpnU3pTEwxuR6PKCNvjR5
	X1GNwHjLGWJSYAUgWpU6/M5nXEzamOzky2urANRYiNabVAzOjuBFtJy/dXLlux6T
	D2+Yn37C/oCvHlWaiJe7yp8KFBg38umAcQzX0ZPu26tJPoTQfL5gY+JmRbkEDA+A
	Q4kEwX2+CYV7704In2NjT1u02zuGO9PTEGmBOFEBaeWTDXOIPi7BLfgNDqJQUuKO
	dsfxBr7AmOt7x9iBsdlAJeFc7ZjMCX2f9yRe+eiHZoNM0242JkCgi3mz/mzMl57K
	EW9HyQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesrn6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:38:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso3025726d6.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 10:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618733; x=1784223533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Otj+Ou66K1WiyZij5ow8vaYwP9joE3fwu+rFitiPLkI=;
        b=Ibz7kd92ekP/HdhKfcAwS/ik1LR9HLBZxEQCg/+goP7ANj8P4zf7+OGVNr/JjEDgJD
         n30OV9Y355HOH+exj+ci/YoZebTY14obLWtzLg/6z4hhGs1INup6Y59dw+FH2eq9Ga3q
         oVl0+LGJ4s2n2kGP2mqL8bkchIdnEC8nF5yPh1EqHBwZEZWV8mWItU2UYmhlSNHIz8xH
         KmTpyicmzieXq18C2aV440MwJJUAL/H+qckB2ShuDsAlPIALZyHskbpr4E8JR7XoSlBT
         qOEBA44dX9+Db6hEVbD0ttlg4ZfOGEGwT7p+9416FrgCtdsCaLvw7krb37o4DrcqXI7k
         dD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618733; x=1784223533;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Otj+Ou66K1WiyZij5ow8vaYwP9joE3fwu+rFitiPLkI=;
        b=ZGV6O70E2a8p3B2iTivsHhuXcsLFYTOxEYm1OpQjXzrJE30aIVdYkjQT1Cn/0GPg7Q
         PDT5/Am4+KyCTts2fyin5whNHDn1p+XAyval2/UEVq/zTNkX5DpXOhaFe7kV0Bha1y3a
         1p1N7c7JgwutJQdouQHeEL7GdF1/wNv3vnmV57/72Sy7Auf7L4cVYOqBbBF2hAVNXc0q
         JqwkXZsUSalZdsZPh21ni5oAGoxu3munYOeJaaLR4wGFtkxzeAgI+7wQbqBOB8BF1Vfx
         uus7SsqtEFl/wiolHv7pOEdOu8AJoDbTkCKZW3BRWwkosX6xmmsuXK5GNXDmILPP8hjA
         HBtA==
X-Gm-Message-State: AOJu0YxY8C7KA72VMs0DZ/CsyiWeOnBh31eYCl2W5+lKQUl6Uq/h851K
	WJ3CI1nBTAWnAs7ydLrpRWpTAv4pm5wMKdXu678yZvTiHfU7Ti2C62T8WNh1weGvvPCtaRswg4u
	dp2xPm4ho3Omp4Tomb7RLjgomzbEazw/+zQJPVw0oLob6katfrIpyNXfxxUPSht/10ffW7ENUHQ
	48374=
X-Gm-Gg: AfdE7cn4CD9d2HClhqk8hquP1ZvXB4IQpfObF1kOMiWH0SCLZ8Zf/DlbLoAiSy16xzr
	q6LVACR6ZiM1aqesL1q4AqP6+87PVYtjFpj9z9ueYRL29a6DXn/iHlKScCqb7p8xYL2jW6DAJDq
	OELAXsnZXKc0yAktXMPBsRjFqBjLW+mUoCPobrESKSvkxQBT8mExsfTjOAHX5DrEonCS77ZP3pZ
	uK2d8Q1LwffTh+uRW1atdrlweb+OhyZGBlyBmaV4eaec1pDyXVO82qkbtJ5ltDz1I3yRWKlLy4I
	4o8mXo+Z7Jhuow+j0LyIOB5VdF13AsqxAEyclRFs5hmBThYuq3O6aJXFWLs+KtfhEAmYhxROUcc
	zLiRkhkmzasI8LDT/07a6H4j8+1qYNnOBPMN4lRk=
X-Received: by 2002:a05:622a:2516:b0:51c:239:42da with SMTP id d75a77b69052e-51c8b2ae69cmr86002881cf.15.1783618733372;
        Thu, 09 Jul 2026 10:38:53 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:239:42da with SMTP id d75a77b69052e-51c8b2ae69cmr86002651cf.15.1783618732976;
        Thu, 09 Jul 2026 10:38:52 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm50653065f8f.23.2026.07.09.10.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:52 -0700 (PDT)
Message-ID: <d48e0062-a3f3-44ef-bf93-c4b9a4533961@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:26:52 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dtc: dt-check-style: Expect first device_type
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-4-c175e6401150@oss.qualcomm.com>
 <20260708145208.2E17F1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145208.2E17F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d1rXX9yFKutOvBtv5MAq-AnoMYJYBuXl
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a4fdcad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=CBG-wTykhPppQsjVDvAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX06jIlEZEsvR6
 mz/oxUzi1TSLwjeRNohBEmYTApdx4eUBxDr10Kdsy8yZdlE6IRwhnEuPQJNitdytk9y6b/scj22
 P4Fvbj1jgQjyWep9XnCbwSRAMUYkoqk=
X-Proofpoint-ORIG-GUID: d1rXX9yFKutOvBtv5MAq-AnoMYJYBuXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX+cmlQ454l+cn
 c/cnA/AdQbC/gMB5Z8wSbLmkbZoDaycQC29iPRgLIAfqXV6y74qOf+rX2W5BfRusTBA9RjkJ1o1
 vUaFzHIPirJz4U8LrdR4tq/plgGMrbGXxtlV1XKUJYLm/2ok68lk8F1naSuL6k/33vlNS15WImQ
 O+mcWp41ceEGNpyv//vGFW5zHfp77EwzJu7uQFr0GEzBk0/ZaTTRyOyTtxsBBWE2NQl4SQAmQ+6
 FsEsc5zv5aDiUuYpjea3IQbZJxACrD075SSjrHsMU/Fln7/4EoXS5uEMJzB12BBIbXjq/v5/dXO
 I4epQE5gsmZTNxGeRlZeDxa3QwRLq9qZBikBINavkINhWQ31dNne0BOinCj6cY14xo+JJvXG011
 O+NOQam5QXr+wIaPzBSOSX+Lp41Ysx6AAGrWW3wsODF/tNwoSRh8z0RR4wYB0dQLmGpbSj/Q5FV
 pLJ9qyrHoU6RXlORfAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] The `compatible` string in the YAML example does not match the schema constraint.

nitpick

> - [Low] Copy-paste error in the comment of the 'good' test fixture.

ack

> - [Low] The docstring for `_property_bucket` missed an update for the new `device_type` fixed slot.

ack



Best regards,
Krzysztof
