Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796F46C843
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934346; cv=none; b=TlpkjREiTnk1Bm0eVnamOkwTE/IGOATnmpi/GUUUvCTEr7QplSNEweI2itp+tdaJm2S92oqDpUiQjZmHx/LBeNVVdYwOH8L8yYpBuHARk/QSUfaLtHsgKVfz8L+mRkzYcyITFafpXQyGuUqOpqup/lX0J/oE+YkbOPjMz+GkkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934346; c=relaxed/simple;
	bh=QpjLaDrYfGFlcPyvm8jXKSSdarzey2MvdB1CxpSvDEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy1bxVdScbIRXkHma6wSmw+6qlUSduXxdJ/pX8tiaowoE2kYiEd4mT3bmS3r3xW44h1hDNS54Xy2m9G134nhkxuyF04s+8TOPtyo/tWVkwd8nba8FQFwNnsYr38UZfxscHcQ3snb53D14USlJfEluyIN+Wxfxc0jXR33FBBhsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpJN3/xS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXodGe5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpJN3/xS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXodGe5R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BviCR3131769
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=; b=CpJN3/xSm9/rhRDD
	3N09SOsXDrGtoEOdHDHpyzjNoStZ97enhEczS/iVqKH0BsEyVT++seD4REBBwXvd
	LUc4nFlKH3brlBB4GUMHE4gj1CSMltD9vBz8MKV9bkOO4j7PI40JLxD1RrGRuTJl
	UeaP+TejBkK6HjYpTCHG1qUCEMz7Qd+bPsqmQrqy+bfdh6c0IcazrrYMamx/AcdN
	BOFC6SHMz9nKkIdTv6o7U1zQJuuWGLRysSWChbaolziF8vPnGPOtsKQilRUt/Rzn
	ZMhwwXJacFpw4ceJy/L+LHCm3gkOFKOyRtrcuLbwQORl+gdPd5gOFKUGxv+azB+n
	fE9Rng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3qcnmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 12:52:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1222519a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785934341; x=1786539141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=;
        b=gXodGe5RgAIqw2S5m5JhXPUtMplT7tphS3S73e3ShXWUVvgw1k3Y3PqMJLpN+zL8Ao
         toA/ETH1VRMMs9nyk1gu620E/LqFCKNPSRGynq4FjcYHl6mF1Tf4c3FFeR/L9qL/3mOF
         2lZZZUqI/dsdRDM9VnAe3LqmjSlsu0VxzKaxcmsv47BPcbdGeQJgztTWyu4n39Z2/sht
         3VJPhe/cvvGR4lP4qrdNU9kZRLTVgVh5pQyneof76bOwErAvhLZQ4qRriiHnC0NXWkLW
         D/nN5PEbIGueaqcaQQsY0hIEbf0OFd6ptdjUE+k1XRiy9K4MQRY18i6hlRO5s1hZYRyY
         /5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934341; x=1786539141;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB9BhREImKmlZOMRrd0Ba2Ei4QlE1yy9ECgYR6p7koQ=;
        b=ZkVyf+OmTZ8L/wUVQoMMuoAgevvv1hNvE3RX45KcIT5wWtsUhBpftztZ9LYJzoSHdg
         W3Pc739O86tuMmsUZ58BSzqCxc6Lu7YsnvDndN8Db94G8RUVQ4M7av6/EeORlTYMvTV7
         I8iYWXLuKfNsI5L8TaFRUN7fHLMRpTTOun46d/PDHim+frOitRfojR8EX/5x4rFzWuL4
         TQ9EUWOXZ6FIArCiPeWfAeN975sVu1WpJi+QB/ql15caY038CNGRneGND5jOoeuIEuTe
         JCHF6mw0CXEoDLqhSdzE9BvBQfl5U662+MTSMPpTCKOL6yXlFbKfaF9aqxBqAROFAORs
         8c0w==
X-Gm-Message-State: AOJu0YwfdvAPxBk2Ne69Rc46cWk6GYnTdqvZeVw+OTgcqLiY+ssVFKf3
	NN4/aq3rCi+QROAFnAJ33nRGTwtTjbN8adEdeaCOsbQvNakgaokjKxFfARpxQkH0AHrC5QwcNqC
	/iWIqQvZvx06bZIe/jDHubf/z6Ip50Y4hgBnm/na4QuJJf8wc+CvYTbO1blR2XAOE1JGIloM=
X-Gm-Gg: AR+sD13VjVJsq6OHyHxplpi8DS5OhGI9NToh5KijUjJk6O5mvC0ruyMa6mAltItZDKa
	Beo6uqTYBvsgSAOvhl+qjLAakYOeAtjeCfdxog+Nbn2QLkRm4dQqtmUL2Qr9JSlUYPQ7Q3+PPKf
	HYf1giNWqMAOYbLCE8+rRXJyqKU8958W+nMmdAIShRkCD4Ey4rLLZEPG8mY7OW8yIDIl6xi3rlu
	Lhzw4XkmVmLxm/+hxnGrT78Im9LrzTpvR7+04i1Nr5mheitOMOLUxd4NKrnZKacsVg4LgFJQU44
	qUQpLJ6nnvb31u0VZsW9i7LuSeouMqMFhRONMWx2RzXqFzuDrmYSJGFQ8TYKsHOi7imQ5/4kg7w
	q3g1VF3rpwsfO/9f1s4e554HDLWqoCa7I
X-Received: by 2002:a17:90b:3812:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3903c592834mr5868892a91.11.1785934341012;
        Wed, 05 Aug 2026 05:52:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3812:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3903c592834mr5868839a91.11.1785934340453;
        Wed, 05 Aug 2026 05:52:20 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fee06b438sm4749418a91.16.2026.08.05.05.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 05:52:19 -0700 (PDT)
Message-ID: <d231d4bc-f0a0-b0da-21d6-cc3da3cb97a8@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 18:22:15 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
 <20260716165434.GA290489-robh@kernel.org>
 <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
 <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfXz1CDK74dhCFH
 AtO5wly5iNs4225Pipt8NgcKJ6pxmDQjbTNqhgJaxA6qvqSb1WdI/e94Mt/4kz4Hn6wNXPjVPWL
 a09XV0ObtaSel2LA4nTeaOo5xHdp3hUAu9V68ub55s5DLHszV4yB5OstBy4ed+C2YjX2ela8YQ8
 +g0cbw2c+VCl7Rkx/XN/5agzVWOl4cCGHLiIKpr8wgGYtIZ1tn0pOyAR0A/+EkhXKsG3wzJ0rvw
 Kp5rcBe9tq5iRQUBGwt17TxPHxzOX4Oqj8LOHhRXMyXRnoHSA5qwTbzaTCTOlXchplAvByNHVRa
 IFuLVZ58BHPT3Quw/82W5HqUz/OzeE1bLHd19J9UlEUgG7lJa1tHMfDPLVgNlp3uuoO8eZM/UJd
 IhC0BQZHIiejmdvpWme2nmiJQM2idr90OgFMM5SaFP7M10LdcZyT4X7zCApHT4ywDfAQxj/1YEs
 RqY8K21quyejs5S86xg==
X-Proofpoint-GUID: KiyZ2tLi3EEHfTV1XRlZc8YwFKdDI_Ur
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a733206 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yb9WwcpXJQ139jM9Wo8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: KiyZ2tLi3EEHfTV1XRlZc8YwFKdDI_Ur
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfX54kIrG0ugAvJ
 A4VfQJdYRExKmNPIezsuBfk+6VuJU5D3ZvrtW/wIQPh+xuNFV5tlvZkNVDfDIC/lBmXdkATtsZR
 pTXDezOJx68NqIk2QI46w5kUGiYL5qM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050103

Hi Rob,

On 7/21/2026 7:50 PM, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 8:00 PM Vishnu Reddy
> <busanna.reddy@oss.qualcomm.com> wrote:
>>
>> On 7/16/2026 10:24 PM, Rob Herring wrote:
>>> On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
>>>> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>>> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
>>>>> --
>>>>>
>>>>> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
>>>>> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
>>>>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>
>>>>> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>>>
>>>>> This commit adds the device tree binding for the Qualcomm Glymur Iris video
>>>>> codec. It introduces a new dual-core architecture requiring additional
>>>>> power domains and clocks, and updates the maxItems limits in the common
>>>>> venus schema to accommodate these changes.
>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>>>> new file mode 100644
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>>>> @@ -0,0 +1,255 @@
>>>>> [ ... ]
>>>>>> +  interconnect-names:
>>>>>> +    items:
>>>>>> +      - const: cpu-cfg
>>>>>> +      - const: video-mem
>>>>>> +
>>>>>> +  '#address-cells':
>>>>>> +    const: 2
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 2
>>>>> [Severity: Low]
>>>>> Are these properties necessary here? The schema strictly enforces const: 2
>>>>> for #address-cells and #size-cells at the root node, but none of the child
>>>>> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
>>>>> does not define a ranges property.
>>>>>
>>>>> Will this cause the DeviceTree compiler (dtc) to emit an
>>>>> avoid_unnecessary_addr_size warning when compiling device trees using this
>>>>> node?
>>>>>
>>>>>> +
>>>>>> +  non-pixel:
>>>>>> +    type: object
>>>>> [ ... ]
>>>>>> +        resets = <&gcc_video_axi0c_clk_ares>,
>>>>>> +                 <&gcc_video_axi0_clk_ares>,
>>>>>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>>>>>> +                 <&videocc_mvs0_freerun_clk_ares>,
>>>>>> +                 <&gcc_video_axi1_clk_ares>,
>>>>>> +                 <&videocc_mvs1_freerun_clk_ares>;
>>>>>> +        reset-names = "core_bus",
>>>>>> +                      "vcodec0_bus",
>>>>>> +                      "core",
>>>>>> +                      "vcodec0_core",
>>>>>> +                      "vcodec1_bus",
>>>>>> +                      "vcodec1_core";
>>>>>> +
>>>>>> +        #address-cells = <2>;
>>>>>> +        #size-cells = <2>;
>>>>> [Severity: Low]
>>>>> Does the example need #address-cells and #size-cells? It demonstrates their
>>>>> use without any child nodes containing reg properties, which directly causes a
>>>>> dtc warning during dt_binding_check validation.
>>>> Without #address-cells and #size-cells, getting the below kernel warning prints.
>>>> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
>>>> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4
>>>>
>>>> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
>>>> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8
>>> Then the kernel is wrong.
>> Hi Rob,
>>
>> Looking at the iris DT node from the link below:
>> https://lore.kernel.org/all/20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com/
>>
>> The iris is the parent node and non_pixel is the child node, which does not
>> have a reg property, but does have a memory-region reference containing
>> iommu-addresses. During of_translate_dma_region, #address-cells and
>> #size-cells are required from the parent node for address translation.
> iommu-addresses in the reserved memory node would use
> #address-cells/#size-cells from that node.

Currently, linux kernel does not use #address-cells/#size-cells from the
reserved memory node. Changing it something like below can make it to use
from that node as you suggested.

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3d..e0d3f3728afd 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -251,7 +251,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct
list_head *list)
    if (of_dma_is_coherent(dev->of_node))
        prot |= IOMMU_CACHE;

-    maps = of_translate_dma_region(np, maps, &iova, &length);
+    maps = of_translate_dma_region(it.node, maps, &iova, &length);
    if (length == 0) {
       
Kindly let me know your comment on this.

> IMO, you shouldn't even have 'pixel' and 'non-pixel' nodes. Their
> contents belong in the parent.
>
> Rob
