Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5A38B157
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600990; cv=none; b=hpE1I9v6T33Q5EUPu2chig3rbBa92S0BtW6R55XCxNh0ot6ZrC1DUPGBpErDHhvANC/7iZVsrmTKa8F9gZRGObic0EEGsY12RWHOr2on24jsQp3NmxS5eif1QdqKfMmzeuqdhdIIr0g83ivkUaJHelaXG0bj7h0SnBNrW2yc1O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600990; c=relaxed/simple;
	bh=6TmWKkSGeDBWaz8DbgLvcTRT7TOD0rj4IwvfWvpbCGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFDA5EJ3fXAXyzQ4JN6pAPS0+g0IuL92DoFe0Ith57el/9DwlsEj2D6X/2U7tDDk6YxhABqEhc+fcbDEQ0EvOcv8rUoeLzvdVQwZdk2hwaT87S3SFTklYyPjXYOqX8sN7mn6Ey/cfAu7Ju2ojhN+bx2nv0oVI1KDZSOr09iZO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9Dpl1Ic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDiR3aj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9Dpl1Ic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDiR3aj5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eZUT3019479
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=; b=D9Dpl1IczexHoxqF
	eYHsLdPDnRksvYvxp7c4dL+ANwnCj3txyQSGe0iUJcldda1oKUzJrYXHPYTcZAx3
	hJuIwx0LheWUjv0h/GH1zLT4JCpDNBVx4vGSX+KzhNtQAjwuLG5CA9/nLRM6CqwR
	V7zR1gTjveyxOUmCJaniKuUf1FzbyXUN1xjeEe9xLcZSs+YNUYxb79L+z86644cm
	VkT1ZQF1Ju4dq8kWx3Kjt1s7jWjR/fH+W/8ynF8My1QXYlaoa3GIFPS3wSQhrJuO
	/q2NthlweHPI0pp6DAKQyHiC816A3xuDn76AKbzvFoziyMvq9Sq/7h98hYkwQ/8N
	otiLmg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8hj0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:56:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-897bfd32c95so176495b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791600987; x=1792205787; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=;
        b=XDiR3aj5PHI6sAu3X/W530DTwhswAmlT8qmrbYe6QDnRKU717FuV/Arnm0SYX/scq4
         wBZELsHto8r+8D/ARwcJdCGf6dI8fLTw17X4YVdEjeP+ODTp5tPJjv5e1hQPCOnk9BSk
         nxshMs76M5ClW/Hh9QyPoVxR+aAgbE0TgT2i64GW74PbLTiP9IrILHrGP83Xi2+ZwLWt
         85s/KJJofapsbPr+mOY9sQm+UPV6zuDuOE18rMpcXnaoVmIqWzmpJWPuuH6jFnwGlRBt
         5qQveQ+ELuBbu1f+B6+s0rD1W0Vfxf2RsuPPbpN3iackGp2SFt5ezMNEpHRowYdA+FRK
         q96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600987; x=1792205787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoFcr0nByFsncvzYnULswKwZOIHMuD+c+aAEs6lpFT0=;
        b=qWFHZSzA5k2RXdIFQSE2g3AH8M9QpLLBBUlw+GgSn7kD36h+b8WrwGATYEkogrLFVW
         oT+keBz3B3JXLXMrPBUYa2p2GOkcq+e7iL3YDShhEFX6WH9DvAgvmtNjcV9hga2T8/l1
         38d3TXDhqINte7awBh7aVmK+JPcnJ55/gPAwHGH4EMKaalkw6cC0RsRq0Sf8aI1a8m/R
         6typDsSmOW6sErx61oOdSDAdc1fJEgRMlxZpSTRs7/tfJ0bpWeCprdfwqh4cS6EoiEDw
         SPZLw6QBWuUsRk45P7xK9+MPCv+1YJvxWQ3xOyMS1Fyvja/UX0g2SVEXqGXe0eI89imh
         Akpg==
X-Gm-Message-State: AFq9FYKyiLI7ErnLo9xzSFtXxP0GUleeynjX0ukujjdbPmencaBrUdKX
	bPNWl9cdeSb7Iefr3C5cokjeoEPpjaeWhh+vF1uzsIVEGEkTGB5Du4w2wwVSaXsIyZGCSnXbkG2
	DzwcvpINFUIK/vP/DOWsuoCylIm2CukoaJJe74CXUh0vLML5z+BcqwI1rwJ6s/psp0ja1MEVmK1
	kPpAY=
X-Gm-Gg: AYBFou1ghxl9ZDa26mmTV2/qOCYKFNOmWv57bGJAOIuORw6euNAay/6IpGIkM18P+PG
	g7p9iEWM5dtVb6rKEEEv+0sxW+KQ6b6USgE560Jbc0uiTvJtb3RAnAE5a6A1sf/WOiZfREeC9B0
	7RhBijH+r9d+WqijvACI7KQMBewQ4G2aZFIwF1Rpsg4JRUGUHmlaxkqQvkZ8RmwO/aUnijH7qEN
	swhai0zkz6VQit06FrlYP2y+6KOJIQ7I3vokWj6NHSXahFfb/wDRAjdoErIS+nTyefABsavZ9VA
	Y6r5LkIsEbmoDBORzEZHWYnRaROW4zinlSNGpxFVzaPl8lQGJX9xtY3xQRpeH8ELk6Xjt/Qe1+r
	8uxw3pTt9ls/B9bt3NqRMQIHy
X-Received: by 2002:a05:6a00:1706:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-897c83afb3dmr3244441b3a.44.1791600987037;
        Fri, 09 Oct 2026 19:56:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1706:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-897c83afb3dmr3244429b3a.44.1791600986534;
        Fri, 09 Oct 2026 19:56:26 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm1792222b3a.40.2026.10.09.19.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 19:56:26 -0700 (PDT)
Message-ID: <2befe56f-dd6b-402e-992c-a2e55ce0d1a6@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:56:23 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165733@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165733@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gehIH4wJWSQz5sYIXuSISgtvdXYIzB6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfXxBnOnK/Nzrj/
 C9PuJ48z2NUC8di4z61o9KAoIOuwxc2GcOOoec6/oYI5M7Tik13Q0BLRdLJMTSQSbalwIL+BwZz
 6CeeG+yrA1gGYVKRp9RrcT8RPSnRIz+e82SPNXQSyD0Fc7I1wQIcaOtxT+QnqfRPAguO2K7yOD2
 ic34ZZ4YBWQ8JDT9JHy9gBCRmNsF6q0wNcnkWyfDiw5vKLhjN1Y1YkifE3CetXSM1P98wtnPof0
 OE37ctD1cGdD8xtp2geiojCbGWC8dPfrbxnzpXhLHhw4hngmG6/RF7uOWBmJ0qDLB1zG9lrgK9Y
 kWRz+17izL0dIpaSqaTWBfAdevly0ELdUdoGWWRtMuWaGrMfvH24Gyn77JKfAIEQJfj8sx3985N
 zzs+cNomAl7j4FCNgP7kgeRV5k0zcySV0oChi3U1RxGcmN70mh3srC/LL+NN4n/JXEsrOyRrpW5
 tE+b6QEP6Qc0GUK578g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX7aeeI1VSCSDe
 7Wd6t0cJCGP7yOQotFyTPiwGTCufjyQ040cZMMmKGdRGb8h9UsoYdHRRWpKckocW19yGDn6Y55V
 XlF2xPOtp4kLxYJp60Bs9R+ihRhDd30=
X-Proofpoint-ORIG-GUID: gehIH4wJWSQz5sYIXuSISgtvdXYIzB6j
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac9a95b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PAOFls9YpP1Q-fK0OEoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100011



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: missing minItems/maxItems in conditionals allows incorrect array lengths
> - [Low] dt-bindings: incomplete ethernet-ports restriction allows out-of-bounds ports
> --
> 
> commit dead4fe7fe0227c2a98000bdee56dfba287669d7
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> dt-bindings: net: qcom,ipq9574-ppe: Add IPQ5424 PPE support
> 
> This commit adds the IPQ5424 compatible to the IPQ9574 PPE binding. It
> describes the interconnect paths for each SoC and limits the Ethernet ports
> for IPQ5424 to ports 1-3.
> 
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> --- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> [ ... ]
>> @@ -236,6 +233,62 @@ required:
>>  
>>  allOf:
>>    - $ref: ethernet-switch.yaml
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq9574-ppe
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          items:
>> +            - description: Bus interconnect path leading to PPE switch core function
>> +            - description: Bus interconnect path leading to PPE register access
>> +            - description: Bus interconnect path leading to QoS generation
>> +            - description: Bus interconnect path leading to timeout reference
>> +            - description: Bus interconnect path leading to NSS NOC from memory NOC
>> +            - description: Bus interconnect path leading to memory NOC from NSS NOC
>> +            - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
> 
> [Severity: Medium]
> Does this array need explicit minItems and maxItems to strictly enforce the
> length?
> 
> According to standard JSON Schema rules, an items array inside a conditional
> block validates the matching indices but does not enforce the array length
> unless minItems and maxItems are explicitly declared. 
> 
> Since the global schema allows minItems: 5, could an incomplete IPQ9574
> node with only 5 interconnects falsely pass validation here?
> 

dtschema already sets minItems/maxItems to the length of an items list,
No change needed.

>> +
>> +        interconnect-names:
>> +          items:
>> +            - const: ppe
>> +            - const: ppe_cfg
>> +            - const: qos_gen
>> +            - const: timeout_ref
>> +            - const: nssnoc_memnoc
>> +            - const: memnoc_nssnoc
>> +            - const: memnoc_nssnoc_1
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq5424-ppe
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          items:
>> +            - description: Bus interconnect path leading to PPE switch core function
>> +            - description: Bus interconnect path leading to PPE register access
>> +            - description: Bus interconnect path leading to CE AXI
>> +            - description: Bus interconnect path leading to CE APB
>> +            - description: Bus interconnect path leading to NSS CSR access
> 
> [Severity: Medium]
> Similarly, should minItems and maxItems be explicitly set to 5 here?
> 
> Without these limits, an IPQ5424 node could declare 7 interconnects and pass
> because it satisfies the global maxItems: 7 constraint, leaving the trailing
> 2 elements unchecked.
> 

No change is needed here either, for the same reason as above.

>> +
>> +        interconnect-names:
>> +          items:
>> +            - const: ppe
>> +            - const: ppe_cfg
>> +            - const: nssnoc_ce_axi
>> +            - const: nssnoc_ce_apb
>> +            - const: nssnoc_nss_csr
>> +
>> +        ethernet-ports:
>> +          patternProperties:
>> +            "^ethernet-port@[1-3]$":
>> +              properties:
>> +                reg:
>> +                  maximum: 3
>> +            "^ethernet-port@[4-6]$": false
> 
> [Severity: Low]
> Does this workaround fully restrict the out-of-bounds ports for IPQ5424?
> 
> The top-level ethernet-ports container lacks an unevaluatedProperties: false
> constraint. Because ethernet-switch.yaml (included via allOf) dynamically
> matches any port matching ^(ethernet-)?port@[0-9a-f]+$ as a generic object,
> out-of-bounds nodes like ethernet-port@7 would pass ethernet-switch.yaml's
> checks.
> 
> Since this block explicitly sets ^ethernet-port@[4-6]$: false but does not
> cap the container itself, will ports 7 and above silently pass schema
> validation?
> 

I will update it in the next version by matching all ethernet-port@
nodes and relying on the reg range limits.
