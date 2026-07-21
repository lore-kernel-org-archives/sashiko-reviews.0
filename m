Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4098E399358
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643640; cv=none; b=TbzOH3wRf03mqOyvy6b0ULORuR8DbEBWkdZGNzHNHvv1Fy3E9hsxABzi/TpazcYaYeum0cWQI2LcFOETQnxeLVo3Z9g5L8udqs08k33AS1KFvQuAF+ySPcHewxa2tMszWgBezvpE5W+OVZFM9GoejAVH7ZkB33CkYE3DZbFLXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643640; c=relaxed/simple;
	bh=B1WD+okO5SZPdNnN5UXbcF17xjkoeaGROQdhNWqWALk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9bpbjE459xuiDXkv1BGFstbvPuzzstOb9JoDa38Lh7t27G+70NmC+1uAy9MdSC42X0pj0Z1Hj+Asn6JUVEv5ROGal0IGsw/F7IUUJkTc8sVLokjdcDxvsYuMlDRSn95n6RLtM5OOFuIA6f8XX/xYRhh75F+MOUOEAk85JV/+nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiBAX4qV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiBAX4qV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0339A1F00A3E
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784643639;
	bh=PNdjn4CbH5IyHu7QEtN2F7JATaXlZOGtMgrhnj4N2gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PiBAX4qV1Mxj6PGeNEjjQrLihqN2ot8EuQYkPex4+qMe7L0Ha+/kw/mrOEWLMAT6N
	 K7P3UYjv5dSs48YaPYgQk3c6iRmx4/m4lVrA9SvEqR/ZT3Jq9L/z+6Bq0n9AEWfCA3
	 XWXUGCqVF87GnXCvsvBm3x3z5TxBxG6VtiEx7WkBpe0hjDIY85ffnA4LghDp4CJ2Wp
	 WJ40FkQJWRnNGkyHFXB3m3CosM0TTiZo6dlSIYkfExJGooG5mp8ipB83eu1vkQ9ydc
	 sWIOvCrRVq2qYui8Rt5O/1MeFjt4GuNI9Pzz+oTqhK2sRD0G2RQrP04XNKuzFXF6oX
	 we2l2hxQ9AfRg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15c42a45adso773766166b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:20:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YxMVit55Y5WNnD1FecNKq3vCtDfRCOS4fNjQiqwPNTqY8VwGaAm
	rSo9K8Zru5DfsaZFl7AZYCnKK5xeSa0fCmUPTJdbfD9Sl0mfiKq+QTnMeNV9+m86IKeCbU63whF
	DOHvwesmPpwWKuL75tPFvjbGPIGtH7Q==
X-Received: by 2002:a17:907:3d11:b0:c15:d08a:2cb1 with SMTP id
 a640c23a62f3a-c1691e8bf01mr974697266b.0.1784643637600; Tue, 21 Jul 2026
 07:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com> <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com> <20260716165434.GA290489-robh@kernel.org>
 <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
In-Reply-To: <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jul 2026 09:20:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
X-Gm-Features: AUfX_mzuIxf7rg6Kk7VicWIFRV-cda_aqpuVchZpZxUHrf60GAuA_dJtAzV3hMc
Message-ID: <CAL_JsqJGc1hJtrxWA5OJh9=R-S5mgDsAZfS9vze4-REwANpikw@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 8:00=E2=80=AFPM Vishnu Reddy
<busanna.reddy@oss.qualcomm.com> wrote:
>
>
> On 7/16/2026 10:24 PM, Rob Herring wrote:
> > On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
> >> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
> >>> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> >>> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on =
a node without addressable children.
> >>> --
> >>>
> >>> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris:=
 Add glymur video codec ---
> >>> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> >>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>
> >>> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
> >>>
> >>> This commit adds the device tree binding for the Qualcomm Glymur Iris=
 video
> >>> codec. It introduces a new dual-core architecture requiring additiona=
l
> >>> power domains and clocks, and updates the maxItems limits in the comm=
on
> >>> venus schema to accommodate these changes.
> >>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iri=
s.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> >>>> new file mode 100644
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> >>>> @@ -0,0 +1,255 @@
> >>> [ ... ]
> >>>> +  interconnect-names:
> >>>> +    items:
> >>>> +      - const: cpu-cfg
> >>>> +      - const: video-mem
> >>>> +
> >>>> +  '#address-cells':
> >>>> +    const: 2
> >>>> +
> >>>> +  '#size-cells':
> >>>> +    const: 2
> >>> [Severity: Low]
> >>> Are these properties necessary here? The schema strictly enforces con=
st: 2
> >>> for #address-cells and #size-cells at the root node, but none of the =
child
> >>> nodes (non-pixel, pixel, firmware) define a reg property, and the par=
ent
> >>> does not define a ranges property.
> >>>
> >>> Will this cause the DeviceTree compiler (dtc) to emit an
> >>> avoid_unnecessary_addr_size warning when compiling device trees using=
 this
> >>> node?
> >>>
> >>>> +
> >>>> +  non-pixel:
> >>>> +    type: object
> >>> [ ... ]
> >>>> +        resets =3D <&gcc_video_axi0c_clk_ares>,
> >>>> +                 <&gcc_video_axi0_clk_ares>,
> >>>> +                 <&videocc_mvs0c_freerun_clk_ares>,
> >>>> +                 <&videocc_mvs0_freerun_clk_ares>,
> >>>> +                 <&gcc_video_axi1_clk_ares>,
> >>>> +                 <&videocc_mvs1_freerun_clk_ares>;
> >>>> +        reset-names =3D "core_bus",
> >>>> +                      "vcodec0_bus",
> >>>> +                      "core",
> >>>> +                      "vcodec0_core",
> >>>> +                      "vcodec1_bus",
> >>>> +                      "vcodec1_core";
> >>>> +
> >>>> +        #address-cells =3D <2>;
> >>>> +        #size-cells =3D <2>;
> >>> [Severity: Low]
> >>> Does the example need #address-cells and #size-cells? It demonstrates=
 their
> >>> use without any child nodes containing reg properties, which directly=
 causes a
> >>> dtc warning during dt_binding_check validation.
> >> Without #address-cells and #size-cells, getting the below kernel warni=
ng prints.
> >> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
> >> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0=
xa4/0xf4
> >>
> >> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
> >> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0=
xa4/0xf8
> > Then the kernel is wrong.
>
> Hi Rob,
>
> Looking at the iris DT node from the link below:
> https://lore.kernel.org/all/20260715-glymur-v9-13-8cf2cbe12a07@oss.qualco=
mm.com/
>
> The iris is the parent node and non_pixel is the child node, which does n=
ot
> have a reg property, but does have a memory-region reference containing
> iommu-addresses. During of_translate_dma_region, #address-cells and
> #size-cells are required from the parent node for address translation.

iommu-addresses in the reserved memory node would use
#address-cells/#size-cells from that node.

IMO, you shouldn't even have 'pixel' and 'non-pixel' nodes. Their
contents belong in the parent.

Rob
