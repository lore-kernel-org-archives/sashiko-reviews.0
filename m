Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF33C1F52
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443237; cv=none; b=gt3zDHZX/GMqVjG87Ei6zD2gF+3Ko7yg0qyZbNy7NIEoWhskTHAqH0qLkt4IfP3OSRWonumoddeM5sFq5PZqgMZHs45xPOmWzGYaBxqGlTQsPA5tKnsvKiCK6Zt+z4E4DtDMFwbNEpQFMdoAq5AyP8pMbTl9eiHFuEuF3pFpYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443237; c=relaxed/simple;
	bh=o9GC/6ank0uxJw5NfpsZY/9YO+co0ljwtXYLI4sQCGs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b9/srXdRNawJIc6eVCLdfXacQyguCyWfI9BiAmeEPLWLm2qXW8xD2E4FYTgTToj9MzaiY/oDsoGPcG4rRcWohzXWHmxudcLiAirIQCcgm9SM8e/ZYFaPqHvJDORkr4ddiDOQqtwPLl0og283HzcrRa0jXa6SwT1olr0Q9wf9tAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdimGnyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PALReV2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdimGnyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PALReV2N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9898t1815982
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 09:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=; b=KdimGnyPsjDMWGCo
	YburTCoVlqDHirZ4cQXWfpFh5+HDeSBFwcw8lNsv6Q4JbquDJ72kX4UQ02gjTpsR
	ErpJY/9t0thu8/ebKBIYsDDa4skf68W2Tq3aeZqnsy7AyvRLdFuezCYVBda5ms3j
	/nqrmasBjBkirux/efqcO93rn0xEhTKsubIrQdtqjVQrAuteMoNj+L8kS8tGLcNS
	GrQft/68IQfmbDgx+zqFGxOC/MTRtsgjxTzNhT9DOU04OMV9TqIRM8em3PShTdHU
	2tir4aCIzrp8QVbv/Ip1o+oz61zIfJT8+c1aALlV9SdCQIpUvSx97Z2hZnSuGesU
	k+Q1Gg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1csp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 09:47:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so4975473a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443234; x=1780048034; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=PALReV2NWmgqH7NjIk9zgKyEWp/f/cktF/QrCKBhxddURvrTDuGEOqCkbEMWkZDZV2
         eRKwSHKKTunUooo0h4ZKMB+stbcI4LS886mywmpJmK0miV6bY+AR3tlAt6Ot895eXO7I
         pdhzEalXYPB040XDi3XwXsBuzqmGR9cHKjn948j1dDYaossAAcLO/sxxCdNoMbxatm29
         ZpCUP5zxwhVljgIZYydGxluIFEj+vK1ppvgrfr3QyJX+Jp5VTKBmxbMGCOD2tgsmyfFO
         3h+2dNqmsl8xIPrsHtM10E//ZJwX8WARYyuvuSkv7FVdJ4hfavak92jO9kD3h0vjNydr
         ScTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443234; x=1780048034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiA+pl3Inn69b7wyI+hzfTnftF/NDzuqEqEnr7gbUrI=;
        b=TMGZEKY8MApa47COQDeeYcIK0aPB7oJlwQk9WfJqIk9KbSky7Sk1BBuRr9CjBDAY3k
         Ss3PWes+zsGucRbRSvKRz3hBlrfEb7CtJyL10HviSxLNC+t4z16xFxubKI7+xAvX9zAc
         LltYA5Vd46AXRFI4xmDJuKDP4yjF9M5mpBNofkGV03kAWZTOR81HLZYx+iYonnlhT1RB
         /zoDWW49l2eUFi+QzeUJjEFaJBEBAJytMXw9/B+HO4EKVyp8rDthBGNm61aip4tj9JO9
         DcVj3QK6pMX3OWt1PcGtwAvx2sIfsB7IkN02QPfV2SRcXeu0878C0d7EUw+by/QoCeXe
         Oxtw==
X-Gm-Message-State: AOJu0Yz+TPGWIB3hHwUiT+Z/Hs9aezRPqqP54BhP5adarDeVvggQNjGm
	mrX1JSGxGzntgBqnjrewkpNVPqqzMFochzzmyD52UEznW4BPTVsKoeciJ49Ueu5sHOfde9TSKjO
	QzsN+oKJnhM2B3kln8ZpqSW/2aCzPG4itxkpvUEVgLulhRNqkJEoJ19r7FSX9QXCuFleZKw+G3w
	y3liI=
X-Gm-Gg: Acq92OGvsuNOSyxPTyKoiyWB5QjrRKHFdpFYfpkU9mvTj4jYj845gu3a85iDfGFdtHi
	+Db3zTZcgOlBgzRIOllvsDPDRae/nOemFJoieEAryBU7uwVM3UNk6ZE7tfl1hbzW4zARlxif5h4
	MLzmmGlWlqJBzBxblDk0v9ImxWbw7kjTQmooQWn0SLCUNEOIJoC81+s+4SKBFYR32OV3YLt77z7
	qMK/iLh5/k4NOrKMuXf4LkAUx2a/4o15r8yoHEM/ntgfV44C7CR1DHc2JK3qHouNpkd0owgLxRW
	l1qoQTrqOwePn/rDKe4/9UBUqPRinotNmbaH90gdH2FDan1OC5jW5B7y6qVWwbG90U/olg1qMoB
	ntm2pz1k4rNDDB/HCMcX4ahaDSccLW5DYVvhJzSBOn/KjKyHSyBLqFGzW
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100572a91.13.1779443234189;
        Fri, 22 May 2026 02:47:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2d44:b0:369:b2c9:a0a with SMTP id 98e67ed59e1d1-36a47ab457fmr5100525a91.13.1779443233648;
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fecbsm1062574a12.1.2026.05.22.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:47:13 -0700 (PDT)
Message-ID: <a3c4a161-8222-4b57-8328-b1106b1b854f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:17:09 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org
References: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
 <20260520092923.0EDD11F000E9@smtp.kernel.org>
 <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4eab296c-1b5f-4767-9e66-22af3474bf67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J2l0ZFI0QTwwJO8AfBwxT0FGLJeBN7yV
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a102623 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=7_kb8tBQChwwwGt_9_wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NyBTYWx0ZWRfX/rdTgPhULkEh
 A0i4kQISNqV1w6heA+gMWtAFUy3XuxH9HXRdU7H5Ea2VhlnoCXc6fPmp7XBAqJmnaHPYJCld0jJ
 6RQpUm6iNmak+GJTWU+Z1umFFr9W2Gi3HeLTY7QImAw6zLDgQciCy8bcLs/SfNCnJQL8XZuovb/
 HqIv06wXaZulylcDFo3s6Zj8lTsCXmIi7E3etsmguOZD0/L9xjLkQqF8wChOawkklJmNReNqdiy
 3ZvhD5JBH3hWjBAtI/R/fN/UFnqyTNz4mbmvLlun31QwBi1A/R9ArjEfOB3ilJ6wYOsfba4ivQH
 dlp1mbtlyAgs7x8TYL4pdBmThCwFxpQrAk4oBbjqalrNlKU0rHC9NxKz3WTu5ma4A8kfQgFqX3q
 qzIkV1sngMoG7Gg5cGkgCBKdjwFOLk53Q3x8Y5E9jKllIvJWjOzP7xTlI8Pdo9KriFX0OcNjPwq
 IuIfr140j0K/LkgEZkg==
X-Proofpoint-GUID: J2l0ZFI0QTwwJO8AfBwxT0FGLJeBN7yV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220097



On 5/21/2026 6:47 PM, Vijayanand Jitta wrote:
> 
> 
> On 5/20/2026 2:59 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Strict requirement for `#iommu-cells` or `#msi-cells` breaks MSI allocations on standard-compliant controllers.
>> - [High] Array desynchronization when parsing legacy 0-cell maps padded to 4 words per entry.
>> --
>>
>> commit 23cece64ecb1dcea6290dbab34facbdac53ff293
>> Author: Robin Murphy <robin.murphy@arm.com>
>> Date:   Wed May 20 08:02:42 2026 +0000
>>
>> of: Respect #{iommu,msi}-cells in maps
>>
>> This commit adds support for parsing target nodes' #cells values for
>> iommu-map and msi-map properties, instead of assuming output specifiers
>> always have exactly 1 cell. It updates of_map_id() to parse multi-cell and
>> 0-cell output specifiers and reflect the actual number of output specifier
>> cells.
>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d658c26201353..f436e26763818 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>
>> [ ... ]
>>
>>> @@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
>>
>> [ ... ]
>>
>>> +		phandle = be32_to_cpup(map + offset + 1);
>>>  		phandle_node = of_find_node_by_phandle(phandle);
>>>  		if (!phandle_node)
>>>  			return -ENODEV;
>>>  
>>> +		if (bad_map) {
>>> +			cells = 1;
>>> +		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
>>> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
>>> +			of_node_put(phandle_node);
>>> +			return -EINVAL;
>>> +		}
>>
>> [Severity: High]
>> Does this strict requirement for #iommu-cells or #msi-cells break MSI
>> allocations on standard-compliant controllers?
>>
>> Several MSI controllers validly lack a #msi-cells property. For instance,
>> arm,gic-v2m-frame nodes do not require it. In
>> arch/arm64/boot/dts/qcom/ipq5018.dtsi, the pcie0 node defines:
>>
>> msi-map = <0x0 &v2m0 0x0 0xff8>;
>>
>> but v2m0 does not have #msi-cells.
>>
>> Prior to this patch, of_map_id() implicitly consumed 4 words per entry and
>> succeeded. Will it now fail to find #msi-cells, print an error, and
>> return -EINVAL, propagating the error through of_msi_xlate() and breaking
>> MSI initialization on affected platforms?
>>
> 
> I see both arch/arm64/boot/dts/qcom/ipq5018.dtsi and ipq5332.dtsi both have
> msi-map pointing to arm,gic-v2m-frame nodes without #msi-cells.
> 
> The new strict pr_err + -EINVAL breaks MSI on these platforms. I'll fix this
> in v16 by defaulting  cells to '1' when #msi-cells is absent.
> 
> 
>>> +
>>> +		if (cells > MAX_PHANDLE_ARGS) {
>>
>> [ ... ]
>>
>>> +		if (map_len - offset < 3 + cells) {
>>> +			of_node_put(phandle_node);
>>> +			goto err_map_len;
>>> +		}
>>> +
>>> +		out_base = map + offset + 2;
>>> +		offset += 3 + cells;
>>
>> [Severity: High]
>> Could this cause array desynchronization when parsing legacy 0-cell maps
>> that were padded to 4 words per entry?
>>
>> Prior to this patch, of_map_id() mandated that the map property length must
>> be a multiple of 16 bytes:
>>
>> if (!map_len || map_len % (4 * sizeof(*map)))
>>     return -EINVAL;
>>
>> Consequently, if a legacy device tree targeted an MSI controller that
>> explicitly defined #msi-cells = <0> (such as RISC-V IMSIC nodes), it was
>> structurally forced to pad the 3-word map entry with a dummy 4th word to
>> satisfy the kernel's length check.
>>
>> Since the new logic computes the entry stride dynamically as 3 + cells,
>> when parsing a legacy padded map with cells=0, does the code advance by 3
>> and incorrectly interpret the 4th dummy word of the first entry as the
>> id_base of the second entry?
>>
> 
> I see there is no real in-tree DT combines #msi-cells = <0> or #iommu-cells = <0>
> with msi-map/iommu-map. All in-tree #msi-cells = <0> nodes (RISC-V IMSIC) use msi-parent.
> If such DTs appear in the future, they would need to use the new 3-word entry format
> (without the old padding), which is correct per the binding spec.
> 
> So, No changes are needed here.
> 
> Thanks,
> Vijay
> 

Please do let me know if there are any further comments. I'll address those
as well as part of v16.

Thanks,
Vijay
