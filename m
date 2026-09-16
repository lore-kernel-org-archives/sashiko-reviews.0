Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E0146A66
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537846; cv=none; b=WpJ1lgG57xHEIryWAZSlBvk1kfC/xsM0n7xXx78NfsV4qVf+LhOOoc53sBXcG/LTJRZGHqrbNIvQxuE6R/RIvf/q1QfUkMi9qNSpdW0OngHO3SEkZgLIGBrgtsKNo1lVStCex/l5n1jX+4n4OPheE984FaymQ77Gkwz5msqU5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537846; c=relaxed/simple;
	bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3i0IrvdgyAcVpT+5rcv/TaaomySUnL0gkWvWaF0PbHWCvQeay5kezzXGkkz4QgwF8QApBb4yvARMhDaaCV3m5btoP8ipSOMT70JW3YPf4KEuNmh8NCpxnlNxYVDC2Et9mP279cp3HiDHr/Sty+94FIthB5Fu2JgFui4n6w5Ea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEonUxes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9BPTBWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEonUxes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9BPTBWm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5mKeQ050905
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=; b=UEonUxesB0RJMWtd
	Rx1h9y+CedLxPMNi3enkDlPUCpLW7gWf1TMbzfmReJg088PvYS7sRotEP/CN6lZI
	ExWHxpgH+8NJWW2aQK92AwogLfb3b5pziILH+hYvb79+NUBajZsc0JOyv2LgDsWK
	oJOlmPXXljov7DY/NuXvEznp5mSVe/a/vQnwcAZktAMaEEuD8tNAcrpJJ8yb3Pn4
	hir+Z69dKyCmqU7WGP9ArjUEZouJ/NJ4yCh2s1YN4Syafm9bgnkgtZlO8Gt8DRst
	Z0EQ548JyjtBeiKgSMzMhNc1mNkk394V3Pi+P5TiSbFDIFT6RL1Y78FMKhJ3iEG6
	VvUNaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n62yf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:50:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso994120885a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789537843; x=1790142643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
        b=P9BPTBWmlN35pxGB0PvlppVGGfNYQDAor/+v70mpdFcRVKpPdXPG6foy1tedPQih6G
         94n9zqIGU0MYanZF4zy1Cyl5dN3FYDuMMF5SjaTUSjGIu8y/7W4REGt+sbDL4p8ylTi8
         PFUUuG8Gf74A/aRwB4QIN3FVJ5pFQFzySRhM78iQIvfmgczEssDWnu/PNrzqpqXh5oiD
         5jsGGR8+3n9FB8Nlzx+kQCSXUkQ1n6eHFP2Id4VuGcvJZDm/jYkNJw6SVFvsqI5wrDYa
         L59ytihAQ2iZ19d1TCKrvabK9t7fhPi+67cL5G7lxNRks7WLlDDHQPAUaHa2loyOnJZC
         20bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537843; x=1790142643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqtaqs/QTUH+71laAr8G4WYL0VzqMfc+u6bwft6kSlE=;
        b=Nwa0KbhVIkIAZwGQD+/cab0uNqbi2iOJcHiaSadUBpj6GBl2NUl2wsB5XKdHBcrvBz
         5n+MN+zrwoeEBM9aliH9P4nKFEW4KP2ShmhX4ufxHsGcmIqL9NxmhgJwR+qoKwnOyO8K
         wRWH0h8kA0+oucEAr+IRRcywDSuktIpkJxZJft5m0PvfyDV1WMYR44oGDsZ1YQaUkLcQ
         p5r2O+jOpn+5WcTr0gWbRMRAA91fH64NiT3SqhLpBdG2X/04DLGVeP/MTTBL2ELsSsEd
         tqkgRHKcNm15pvAQeXpTSrY5lJvs6xeq5zb1DfUAru5eKfN5aJ8xwukRSBgv7cUn1+eK
         mFvA==
X-Gm-Message-State: AFuF++mNGAl8F0yz/xBju0JRNm8RVlnurfbv+CicjMQZ5nilKyBG4Ajf
	c7Wy8fIc+gdB2HIjXDYxX/U/XiSElQEZJW7WksPK6XVY/do8SNTyFk1jlG3xnuH5EY40DVJwi6s
	E5z2ZWTEB/XM1yijy3kUd9lszIV+ryyHlq/8gFSCWmSpk5SfqZYGI+WxnNtSFVMJwMjsLZnEGdU
	E1pMQ=
X-Gm-Gg: AYBFou3NvZ6dSeXp2jPVhrMtKIOQV1tX9Si6UCZZUvoF/ToCh9w8rDZwziJK5xdpfes
	izh3wDys2gteAkSEwsulDaLNW9guBr5q5QQ6Zv65dVM5EpXMl2T1ECM43FE4IY8aM5IvQbrqzbw
	oVBhyErbFPI+XsbgKwpeI+cQcdbwv7sT3Fir4pP1IJPKywU6k4vSeJh16NgeMtWtt/L+4nutuH7
	r9hKuo0M2Q/qg1zM/nIohkUe9/N5sVyFjK0aXJwXQozHaefp/VJhgKzgOO5MrxFssCD19YicB0D
	aHYIcYiIBpOgVghH217Jhyke+LPdiRCcmFyNG5nUP5xDmskRhrNCkV3t5yyM43FbnwVpXywG8RO
	Ss18GUBGtZIOs5RRUDg0yjgWU+zyE
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr175221185a.1.1789537843071;
        Tue, 15 Sep 2026 22:50:43 -0700 (PDT)
X-Received: by 2002:a05:620a:390b:b0:939:9eb4:888a with SMTP id af79cd13be357-93bb76a62dbmr175219285a.1.1789537842682;
        Tue, 15 Sep 2026 22:50:42 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm4317243f8f.34.2026.09.15.22.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:50:41 -0700 (PDT)
Message-ID: <84ab621c-61d2-4da6-884b-05118e093d88@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:50:40 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Relax property ordering rules
 (drop alphabetical)
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
 <20260915-b4-dts-style-checker-continued-lines-v4-7-5b8e09b11ef2@oss.qualcomm.com>
 <20260915173834.29EF31F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915173834.29EF31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa2e34 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX8sYK49l6QIga
 9P0Wpy4nBJMoLTU819WAWUL7UDUTZV2g2zKj9EvTHgKzyylJMeuqhZwyahCSlJ1UrjW1kjzda6F
 rZ9zHMuPCniDetAiyCKxUkvQKfYOuqmjXmjn1eNck9Jw0GDcaNsh/yws6Y0TcYl2+ph5o+9hXPE
 pDDqhdhoYqmsfTzVBOP8/L78uWqu5iO385LeA+qXjLwDcg8CBpwXdyGOa52+bnsQOC300FzyOwh
 LmN537bm2ei2/DRb/A/pa3wLF5l4HPUbzHZ/FdEVk5Oek3w5pb1a3P6LC5mexSF/RoWydMWWEv6
 QP2Wg6oKeQ0nCjuudHb9E6hQvRKTa9xVVdJKRAX4Kcg7xHYRBpnjeeRib6yuoC1z2kkFHqjlH0e
 w+nLeJdRmoh9YB6hLIrFTYPLpRiCpnPSazcnMyS+kCxsg2OJ0LED1mXC3K+kje4Ph/gTFDiY2jl
 DZEC6W+54uOC3MyDDNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3MyBTYWx0ZWRfX6yQ4NxqPiD1L
 NlCd/l32QS8G31XG4mygCrQ31474pn+nOYkLWoNhwnIDwZwJ4pKf+54dPSOoJ9UARDqOl34oa0G
 Ztet+Q/94x+ic/4hKCkid01AEPS2tUQ=
X-Proofpoint-GUID: l5QMFIuRwzABYtFWXFBR7Dx_nIOKUpJQ
X-Proofpoint-ORIG-GUID: l5QMFIuRwzABYtFWXFBR7Dx_nIOKUpJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160073

On 15/09/2026 19:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] scripts/dtc: missing pairing rule for #size-cells in dt-check-style

Not yet implemented.

Best regards,
Krzysztof
