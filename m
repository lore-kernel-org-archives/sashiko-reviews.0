Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B519B5B1
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099602; cv=none; b=jEPO2yeI9OdvcnO8w3CmipXPnGFTKfQ+y91mNJZRBk2E1An1mUjyI1dUeUweDkXVikMUQ5vIzoceKXwMWtcASRrp6gmKhuA8xvBB6dYLxm/J2n2Ofva5zNE9srLQlR0V+sZjGoKhu0j33WNpUqEhNTy+r3+XlAJhHQso+lSkdI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099602; c=relaxed/simple;
	bh=5goSxkxIQT4UqmKl9Cni3nVPIG3pAfnj4ZouzepPtZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB8ZP5CdtEM6qhF1Ne/r/YG/7FizDH/EPd8nJuweIZonwC7pUzIocDirJXayjl0TaSzyyYE1lIMlo4IpphxBQkyHjNR0UxXlc+HPF10fVIWPhJKeOH7MoKR7IgW1EFcp410Q9zGBMCgx0fJRIh/qivaUPMFJa2+ryZOgo5Wvdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZqStRqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3zbwgmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZqStRqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3zbwgmf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6voxX4177759
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5goSxkxIQT4UqmKl9Cni3nVPIG3pAfnj4ZouzepPtZg=; b=PZqStRqkgMqQqslM
	/LAnmM86auzN1ZbBOmbon48ZovijmeMScgPL1Mo1HVgh/De2T6LURUD38Focafvc
	fpQE96wdflmaWxgZW0nG3YAc5mfhB0YmhZg0hVBPH3KllOZehcoZamY1YuX4kA4T
	jFICYP8aktVQsItvRV8LxdiC1qCiCqg65KCR8KQyzolCu0uUAvsVNppe37FL9P+L
	YEbEFNYbpTsgeQZUjHsZA9eppUxEqgie5MTrNtCuDJI71czcJPn52ppV9b2oAZv/
	T+truAXAweDOVfpX43CG6J0mjrtFRwH9PfpHJ0cE38oMVTCCpmwHy+vse0oIRXWc
	Mr0ZXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5xn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:20:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso51365031cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099598; x=1779704398; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5goSxkxIQT4UqmKl9Cni3nVPIG3pAfnj4ZouzepPtZg=;
        b=a3zbwgmfR54FnMXVTnhtFzamxK6i5jpRJB6Rr2fiEZGwwNsagVLbhcJ0TKMU+/9Sbq
         1KuH+40rgVFGaPOsTtw5tX2qs9KbaRLxB9QphkinrbpUs953GquuRJGU1r2LM1s+XCAz
         TfG/kKEQ+lPmdipHwB6rZ7ZLL3p+pFBP5ilaMJDrn8/qV5Vw7UkuPxJnz0EJLf2JyUxl
         lNvulx8gHA66kBoO03wRAUxWzROuLKzdIP+wmT4gZ1GRWg9OCFwOWPv3ZIDneUgCTktw
         geH2cJnKGL4pZSLv7u0t3gEiYgpuLzOngz2jwJ4SLv25sPIXtOaFdET2t/4dCtiY4w+p
         hErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099598; x=1779704398;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5goSxkxIQT4UqmKl9Cni3nVPIG3pAfnj4ZouzepPtZg=;
        b=iOuef0KovEZ7y7a6tQRbuyTkx453iOkXJnFdmDUFePhTU6ZeODfL4RcmAS4LU4KmUf
         wuzcZfWTUTBkdoY15sQbqvGbfpzU+wrkPXj4RNbWsJntutnDxSoiM+vxGMkNHgtr1NJo
         yKCZJep5zTFTA48YJyqTHOC6THNspzzdH+MRnJ2lnriclPKP2sN38LUxJ1Alvl+4ZJvV
         FunCgcmiodHS/XTraAELUrYTGhyO1S74LCeIU4pnqnE1Lg1/sAafr2/tbOEtrEWoaL6S
         UQi/0jFdNDVQreAxxZck03/A4UEhvSDpghgpS4u87fg8mbnraXJn3hsESOwXEP+vMDrs
         4bXw==
X-Gm-Message-State: AOJu0YzzGXOB8Xmrbq4069bR/M4cZrAIJCBJMYhgS7pv9L/22MNZdRm5
	zmgxIp9JQMbPDmEAVLsbON1uSvWlBVdUcS4zATvWVtLjRFTiQgBpMkzLSe05Hho5iHBMROlMR/1
	oQzVUZ1Bs0AKRuZRbAjJSnP0qe1VCesFA4oVwA5lxT1EiiksxsPC6prPXCjhT3Ksqy37/mlQtX7
	ROlHI=
X-Gm-Gg: Acq92OHugmU0EPHsQavbHY64kqsh4U07xms8rUwM+ZEJ5bpEvqbDd881hKQ7rTGRFbx
	/SWPmWaL8syxbtWKL5CKl2yHqJP9YgLc+Lb/8T/Z9KQoVAoXUeGR3H4osKmRyblX8iuxxy4BAXw
	lIJ4YgxqvIFCPkR7lXPR2FERJ4zwr46gQKORu7+cFCGn+MGrICzCTxTGq2fjPBOizqXdRAQkkl5
	Fjxv+nkS2p8HYeA5x3zdOVvcunsA8CrkoYYuT95kIaw2mTefRJHOm2G4z9PR/tAIRhqRRoaSe3+
	le//FVD0p4KKAvydU9dyYjtzkZrXHBOKu3KywLB6MeRvFy4Kx442NVL0eS2XXbf+52PtRX4e2RD
	4uPSHGsIiOazJcd8WmrfNsNpMRNvkhlaxUEl7XhfzrQXF+QLp
X-Received: by 2002:ac8:5d45:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-5165a03ad67mr216996021cf.14.1779099598553;
        Mon, 18 May 2026 03:19:58 -0700 (PDT)
X-Received: by 2002:ac8:5d45:0:b0:50d:7c13:6b14 with SMTP id d75a77b69052e-5165a03ad67mr216995571cf.14.1779099598010;
        Mon, 18 May 2026 03:19:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm38697549f8f.7.2026.05.18.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:19:57 -0700 (PDT)
Message-ID: <271ed3a6-70d4-48aa-b75c-ecd12c364de7@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:19:55 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260518091942.29822-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260518092718.B33B0C2BCB7@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260518092718.B33B0C2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5OSBTYWx0ZWRfX5VRBnSr1uco0
 LYz4LuCQowlNJqV5Oa1xJ/48aShbQo1GjHbTcQ2Zvc3y+AqW8CPoHt5PuGUSJ4ovAGTYNflcAMw
 lbzEir35UHOJCeGgfiVuIwl90wHx6YpVV94LSBPPhQ1aWxgzz/azCMdMq5KSk2P18E2JLlK1SRm
 EVP8zGe/23zNWFvV+dJu08gyuWf6e3MJL+z7CIfqNDClpbOD9rzXuhKXrWS1/Qdp/sWJQwcd0VV
 7tgkoAlkKPGmbHuJp0xWZeIzdJyFlkUnRzNAP6SFOqaKQuRsADq07Jc4reDYCvb1MqrK+EvxY3r
 kPVB+FqMndi6sT6xuRypRkDW+/BiKzb8X3Vkl1iamlFYZHI0j7uGXso/I2IU4KZAYIFZmtSGILO
 uxTgSWSOWhVP8xptDVhMjALQxDyC22OJ62aK86+EWnlNqbFyXDx16PHmxGvy3qv5LzPj4YVxFWz
 U5GQwlDuTzjmBZfWnWA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ae7d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=_wehXXljX90MVKpcQmAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wkoDFoJAxWYiYPyuT-LsMVQEzJah9D9z
X-Proofpoint-ORIG-GUID: wkoDFoJAxWYiYPyuT-LsMVQEzJah9D9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180099

On 18/05/2026 11:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Typos in the new documentation file: 'Pachwork' instead of 'Patchwork' in the section header, and 'statutes' instead of 'statuses' in the text.
> - [Low] Incorrect tag ordering in the MAINTAINERS file.
> --

Ack both, I sent v2.

Best regards,
Krzysztof
