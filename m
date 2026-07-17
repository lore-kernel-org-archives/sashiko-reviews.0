Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619D375ADF
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258627; cv=none; b=MTcxYMtUmhqvp94oA+oyRMuL0aNuW+5sOilXHHwleYLQz8DNcunG+qkCqfMhicF1wKUdRfZDvAdRtqi89Jk8XFiFnT+gfg882hC+aSGyT3ZwrU+A225Ey7UmEOnK8CH5TM4PwcGR/tFuAJtwUuuC9Cow3qiEU+4lNVEhgANAHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258627; c=relaxed/simple;
	bh=7Eqw+UANy8ZmD5J35oxC7mY1QMeVLVeLuHMKwxXbdhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utRfLuiTAtRQdk2cQm2cAsubJya2crbj4YukcUIakGTuRqz49TTJFVYGWZU+sp/irNRpK6vKpTKBbA4BFCYubn+oNFXt6BGhryBTExta+fkCBwBzFVmSTjl1IFNakJm5ZrgTpolQ6yAc54Y+fB+Z9rwsAn/PIF9MQDhmL8aW6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBjFOCIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqII/ooX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBjFOCIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqII/ooX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33pIc314605
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=; b=gBjFOCIpDOUgkrQY
	cqHQfB96RMEEeHc4k7ISnQ2+uAFs5EZWZhZD9cWSPj/SgpED4jBY6t1LnPIXdhXB
	uYaLgxJvKPZ1EiSD2ADuLOoDjMSiAjEaHebfhq51BlMJhGDOzVlHC0z00od6J1mR
	+6I8FzjowGiFMDWnFeIJ77ADXx5e7btNxYM9e+9zGGPXYJjPQ7UO8PW6dZhXG7np
	haYr5ZpClRtUz6EAEHxYZLHJ2esUf+x4kWdz0RsnQQV9ySiZW7g5cPbnwbVwAEd0
	jdb8DiXGgHMJq+GNqQMGgUPE5NxL5iy33SXWu1H2wmktUs0SC/N1OhNp1BFs4/im
	yihsUw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8htm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:23:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a4d8fd6deso5231990b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784258622; x=1784863422; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=;
        b=cqII/ooX5Jut9xKt1arYSb2G1SDXoXmwyC5ccT0QvraXGm77wKGxIM3hSDdEmeg1cO
         rgg2+so8Sv7tt6KEFbbR2qJwtTZlYJEqm3Iul06E9f8Irvxm2F+Cxd42XIUfft2y+oxJ
         rxYpMf5OfSTOAd8fgEPxcMbsFcqVu7gONdqPmd/MhrVsUi9JllWZSuWjWjn/M193Os0/
         vK8z0gXbqxwLaGudHqasbA6qB9ifcw6Z07xvcWf/zeZuFl7QL679ijESSsULf2VQy0OA
         Jy4KSqG3m2ciRZ8YMdWC0yRxc3rOF+NZ46k1nJX1VeRFWbjkbmm9aw9YQXZwC02RhOXh
         XHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784258622; x=1784863422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=;
        b=T0HXNtpVcSS8uUBz67qpwohxcKBXCSeHzMPZm2YvyroTwlFgpnKEKpNmrM3Ux/By+G
         WFG6kM64DnD8ipakk2l8MthdzKG3/ymTMnyiIp2mj6QE6DKK592BMsuJqaWmUJgYeJS1
         0SUmxc9ddtsboQEV6Cp6VvhiQBISz+yqe9Y8c4MLyHkDKS5mgOiDmel5er0tLVgd85wQ
         HEgonMtt4LCqNG3kKCDsXKLCWchYkpfWUgKwmHxt6UZRJCfplBdsj8VseeUgf6LSPgw0
         V2KWylK08u7pbwc2RUkUc1LVUhkhr+AUXGFg8ur+QKy0cFLKHLykFd1bVsvbRZ84fa7+
         63FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4HpYx35NMRl7MAvAVlvrYj1zwXoZUdu5T371t0tctHv3trrYp/ZwYRSlQkz3GIQS3Z1FNURICA33dWbm8GUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbjxChlNvTc+7lbVnGQHd2OXNABXZrM1+MoHcDbnpX95ZOe1bN
	UPConbTejfJSZwVFxOaG7qd25bXl/J288dUmrxP63CS+5KV5Hz8ErWbduvYTwwfpkzYBrmGa0NG
	6UCKj4jQoxISHjCSXGegKdsgkDz0iI1tK7nU0pQXiudH4+9a/xAZ4XbWlzh7OZokXwwXaeYc=
X-Gm-Gg: AfdE7cnrT2iYpbPqrI5HBEeclc8wjLODCOiv2v3YfXQuuAvllsPoTiskL1W1ee8qeBB
	nhcdd/5xmYCV3X+NMD+Vi65hJ+j12QR0OcBHHC4k8COu7Elk9UlGIUKVoIjfeUcugANzBsb5Y4i
	VL2uNjC4toN7rdpOnvLGxL2trZfFV2y7BIsXuVHZRIELaD62ebXSaA/+WUwLoeaQ7uJ2CuHzsTK
	OaGN9nMGPG6bZVX38TjIQuWsQhDZw5h4YYMW1Q2Xy/uw0UJCIVII8migSjh++hWXMI+09qNgRRf
	Kfg59tU9iydvqG4D9SoDTrz+hA4jHsCycq28dGR58LK+kNySTklUjM0PntvnLxvGkF48mezStiq
	Jg3gNZFEWkqhHTSmzktgoFhjHDbB4CP780FLeA+VbtGCRHfZnUDOdiuCQE7Wt7xWf2jwU
X-Received: by 2002:a05:6a00:179c:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84c29274827mr728779b3a.24.1784258622068;
        Thu, 16 Jul 2026 20:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:179c:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84c29274827mr728758b3a.24.1784258621559;
        Thu, 16 Jul 2026 20:23:41 -0700 (PDT)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfd0sm138573b3a.25.2026.07.16.20.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:23:40 -0700 (PDT)
Message-ID: <30956c63-1324-48a7-9543-2bda8d716bb5@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:23:37 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org
References: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
 <20260708051716.3C4241F000E9@smtp.kernel.org>
 <20260716130721.GJ1260374@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260716130721.GJ1260374@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BnaWFWCRV2xtWrMGa2r0SPVfRmeNyRMr
X-Proofpoint-ORIG-GUID: BnaWFWCRV2xtWrMGa2r0SPVfRmeNyRMr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfXwH26KWO7jizj
 nJArEBFk94KQeuXy4+cS24BiKC9I+yNiiENDUL1I4uAZk0xYR53g5NJWMxFFMQ221w29e8hQsuw
 iYsxuEoWTs9migK9dAplLBePqLW2UTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfXyyIKkrig2ru4
 El+DmLtXGMoc1Qjg5fYg36aVtT9P4sxSoPSxXMpGHYDB8aGMPy5OcEero4/gszQtBr4CEehIPlF
 egulsjDB/eFF145oOU/pMEjr+EODHEOpbRWIeQcUjfOOFi+XmbahOLw75saAxxcbOr/fZjdr2EC
 qTmCPeygVjjfLu7yLp8SQOD8hPnRq37CbvIlHWGzeu3Jbrkc05g3Rw3H4HiV7dpocZHTp5vjxiU
 uR03dtxeeywcm7eZuCs/WwI4es8cczgaDy+ES3tYq88NbpMlFkDB4OZbUYtMEIGMr5wSW83RHdm
 keVMcxiSa8hudUWveSoBqxg7hRRIAln2y5AoJjI6Ps/yelxDq7jyn5isvIVgOZadQCMXXZPPutJ
 IsH39uH/Ea/yZcf6hegCfCZ/92sjqVnvEPAEjUmmEyrbQvA8i3Xi4nllwtcL0SZ/Znm2cuGu9ky
 WN3RHyYjuYyR90471Fw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59a03e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=zfrkMIPrB1FTTd2ez9sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170030



On 7/16/2026 9:07 PM, Lee Jones wrote:
> On Wed, 08 Jul 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [Medium] Mixing goto-based error handling with scope-based cleanup (__free and guard) in the same function.
> 
> Either provide a good explanation or fix please.
> 
Okay. I will update and transfer 'pattern.data' to a '__free(kfree)'
local after 'lpg_prepare_pattern()', to get rid of the manual free and goto.


