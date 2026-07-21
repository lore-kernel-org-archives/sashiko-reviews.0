Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B9370AFB
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652578; cv=none; b=rLF+FW9qAPMz0OV9UwDF5JIUaHXIUqcLyLDcnbeslZtYfbovhvpPXuE2i4giJMgLnNG3gAWIAFxSliBNvd3+BeOKdDKGX56UO0+ssHLmHTFPcqeo2FcI2Y4G3F5BdzAjB8gD4opKEMEhBm+0lSWiJVxuYRVPUJIvmmJgDeXHlq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652578; c=relaxed/simple;
	bh=zNHnVTypKgfgvOficguWFVlpkvG6iHharcWR4PswgHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUEwgsKSzE5w0Hr5k4bV66zn9WyglWtFMkntY7ssSmR5ik+0vVmuwMR1C377BNDs28kSIEvufMCXAidcEFpHFO0n12fepb9lXlvA/HE0zY2iV4jnVJ897Ex3+hMgfo9Evqtnqe4RZyCpBCwy28UW/6kWUSEgfXIfU0xoCbp7y08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRWq4jR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikpe0+mM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRWq4jR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikpe0+mM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfqfu1687307
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KLaMb5Nn+c0pJrhabC4RdLZ94OtddIVgvprkhAXtwA=; b=IRWq4jR5tAK1Lj+X
	tgfzvYcl1EeXV6L3DdGAmq1XSvUOyvGr2C+UwmCgfQf3jLKW7G1NWIy/V+ICxU1H
	TdIcasyApCI3jcORv0gj4gvZno83PyURstN5cDrwRXCeusSYfgNPJBXROfKay5ZE
	J87A4J1ctzO+Y4IEaYG0PYveP1CARGoUyDn9xQXZ6XIWf7QVBn2IeacQ1r1OapS2
	ysaMnzLCynGXNDtvtzZ2J1YAQtVHMjvi9bWrqZIBne+TwLWlHawGx7qPDijaj8ii
	sdjxepTiuFJXbOxaUM+/3WPtUTUgwpp1Ltz2SrCmyebh1vtAUZVRA17tnpieCvoN
	azHKAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c4135e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:49:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc77a6943eso197355955ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784652574; x=1785257374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KLaMb5Nn+c0pJrhabC4RdLZ94OtddIVgvprkhAXtwA=;
        b=ikpe0+mMw/DwMoH8dq7c0B5iN5NCBSj8KH+ykLfrqnKhNNqRWMx/0j47w99WLySfyz
         oLq6g9KFgMUyxLAwP1c41sQSaCArk6+IKQ9NaXYALFnrJn6zJelo5tYrjw4amGRueaP6
         l9UU7d3Sl0vy6sazIid6gfLdncoh/j9wmqmI4GKBV4c8aljhtTVJ4hkjK+kxCKTF4CD0
         4hVjJ++Q1P0wYr3IN6r8CZ2QdGEQfOCNrMzamN/oXhel01Q8waD/n1Gjtksrbwmv7IBm
         iMXM/qPfAVvr0UnFGxDzWkOR7XTIX7S7alu45Otd3ObnS/KszllolmAKIjsukapgP75W
         RTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652574; x=1785257374;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KLaMb5Nn+c0pJrhabC4RdLZ94OtddIVgvprkhAXtwA=;
        b=pJ7cimG2mJAkQbKNr8vzTBVZCO6deaKxKSvAKfh+0KxyIttRstG7wr9OeaHH0Yu8DL
         s8uM/MKN50K+3+eysn2nKnZiW/p/dO+2uK+wHU7aVfIkGL15d+hQHYJTLrB5f+bsumb/
         sujS0LJ7vMGknsbGEYSo53+MdctnYvrgoCb+uErJkfNzlgtJxIWuIYMDMzBWTS/QgxtI
         3O5Gd9TjgZNYgp8UhKO+zGlEMkModtnLJVCK2+ytI7p90LqTIVuSofGClt+5dw3PF88M
         sB+8ko8pWJ16X1weTh5/Ff5V5OlA1bWK72/gwGEqAiYBqWy8CCrTngrk0LcYyI5gLK4w
         lXEw==
X-Gm-Message-State: AOJu0Yycx7NRZNsnDhLiSqn3u4JDk4Z55wcY9z18r/+tkdhJ4l6z/vS8
	nIdumDrH+u97jQ6ToSR8HeE/s87F9mZU5a66U/8f/GFkGv0xwl3nWa8n05ow2Fook7Lefnybbzm
	KqVRVThFmCt+qpMmRbXMt5WBYOFDQKjjgGjrsCFeNQ3FPUJ5WaIM/Ko5/WQXLdrBRwtDwsh2uQq
	rgdRA=
X-Gm-Gg: AR+sD11bDLCUMKO88Y9R3ABf4kTiX4lf2IRt2dykWkLtdh4XQ89BsflCiJlDL0d7UDE
	f9MVfC4Kh6uIHnlHdWKVjrmsuPreTYw8Ap0Gf4pJ+597100M9IHtmFQBbIkfhks5zEMFFvOa771
	D1I2xaNr62dCxMiXunwrUWVKRRsPMdhd75NfKJLezJhH+9UIeVxIBf3Dcfs4xpk7tVE5lJ6e+y4
	I4+rCCBkP5EWIoDAEyUMkxvT3BE6NI2z5g2aUUy/cuO5hPmK38zqQ5BZjwX1BGokNIok9a0ozac
	35BNC4Y2OEcx3cfK8YwYBI/RUyguD0wih7hUpuelO72o0RvniFFuw5wfOsX5RvFvYdLamw0oKQR
	Tx31GO4UMfefcN2sUzOaXMXfNqy2j2pvU
X-Received: by 2002:a17:902:fc8f:b0:2cf:4544:104b with SMTP id d9443c01a7336-2cf45441560mr173412855ad.5.1784652573777;
        Tue, 21 Jul 2026 09:49:33 -0700 (PDT)
X-Received: by 2002:a17:902:fc8f:b0:2cf:4544:104b with SMTP id d9443c01a7336-2cf45441560mr173412665ad.5.1784652573307;
        Tue, 21 Jul 2026 09:49:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm684593eec.2.2026.07.21.09.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:49:32 -0700 (PDT)
Message-ID: <c9f8cb9c-0b6a-d866-81ae-02a0e14bd9a3@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:19:27 +0530
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
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fa31e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=yb9WwcpXJQ139jM9Wo8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: FmyZRUfVdcpYygRFi1jByagOFabDGc20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3NyBTYWx0ZWRfX+OTOIM6++YDK
 TidcCfcFuRbMIHLV1fsHuzzE7XEya/ZqyAdirKSDM3EOVOHPO194TaJL2z2PdOjC8Zg78ZVeRbZ
 2TxVIZ/cAbbSJ/XVIbH2yHxQ54AwbdZTTrIg5a2lCNcuqGA5fTySqMW+dS0IaPrT/NlvD6BbfNJ
 Ag+4u+SRmKVHaMrUM+61CStK7fKr9Za9hsNRxAKEsUKFbycISHzyY/ZJyXEIggunjsUv3DQkDVL
 6iCKZBePJIz93j3ZeohSvPu/iJ0IvQbzISe7HvucQ7DkYtcWwIwA8GXxmGciD6vN5YLKjxNmSET
 Tn1SFhxw1vr2fRHrutk3NzXSzMzGxP94DdFgb5OpUID0QLKIMUHDj64lVKx1l0qLX8ZL4BeDWDa
 qupyXcFsICLdTYH7fmy4Vy8bzWVA6le77ZwfgFMKNNnaA0UDdVdM43y5j3jy6QlXN58PqlKkQZV
 EMUUSdUTh4sk/D3B1Gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3NyBTYWx0ZWRfXwFvCkKINflBw
 J/js0kk4V1zu9k80xK/Lz+qXr31CPOCWYXrkwQRTU6E0ADqlr11D9NeeszcGRqLLUCWmowuJ/QU
 OVED0/MQY2M9dYCx90Aw7ELK7LFOg9c=
X-Proofpoint-GUID: FmyZRUfVdcpYygRFi1jByagOFabDGc20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210177


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

of_translate_dma_region() passes the device parent node to get the #address-cells
and #size-cells. In this case, the device is non-pixel and parent node is iris.

> IMO, you shouldn't even have 'pixel' and 'non-pixel' nodes. Their
> contents belong in the parent.

Regarding about pixel and non-pixel nodes, it has been discussed in detail on
the need of it.
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
https://lore.kernel.org/all/f61a0a67-2cb5-4fac-818e-70eb9ed69f95@arm.com

> Rob
