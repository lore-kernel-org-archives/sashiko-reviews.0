Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB90175A87
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 22:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781389950; cv=fail; b=lgoYN/zy5mrtYNN0SwPzIg/OkskJoBX+m5Pg82FKxVg4vumFQL81AdGe+Wu/yxozUBK0pxFhpkSullB/Jh9VJAReORhUcpQeZjRAPnzX4ltJ+DZRcczQW+kLj8gUEEQb9x679Vvpv7r6TJTBh0mA2pG09z4hRnZ9NZ2FS3nQTPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781389950; c=relaxed/simple;
	bh=QTx9041dhhMcKfJPsP1m79Vn1j8B0I/HYNpHnE5xa8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKNmxxsC+2fygxSCEFfR2K7kP1KsHgr1fekMSt7yup+CXkJ0WbSGqs3jPrK+6SBcFlCZeVp3Du8QutJWY/fZd52k7s7ZFI7/GdDslZpnhHV3mrwA2kB2uYd+Q84egoZABOG3tRPIetHsdnu0ainWRNl3oiEVIZnagJQ9xLQsa9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=rsF2tE+d; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="rsF2tE+d"
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DKPwTR1586427
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:32:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=92RmcGHbhf5Dgq7ILHGOiuMda6Ei+OUfewhzqJcCUNQ=; b=rsF2tE+dN2jV
	8eSKu+oUcO7wcwlrfJk9Pn+sNPKnf6ltXg8x/OTwIZ84uT53mMdFnfRTfogreJTl
	ux59CUebsLYlnA7MhUawpqRbFwNyIqdqkq9zLr1FwMv9slGPLI1CNtJ24Lfu0llZ
	Rk6XPtUNx43hUJLKH+gKhMifA2LssSZ6uKuYy5WjsYzmHXE78JtBry5Pbeqw52kW
	ejazSNvM4mpnSf8D3usXWACDowFONzH008jjUEsbGk43T1GWP2zxiWOlql5NU9iX
	kSspyuuh/5nlyZq/g+/vZoFqs8rDYdQb1QLQUgbtulXEJrCOyULq00O3JLm4c3KM
	aNoVDcyGww==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4es2bbjggt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:32:28 -0700 (PDT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6d439842bso3359919a34.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781389948; cv=none;
        d=google.com; s=arc-20240605;
        b=jWCqP9qOel8V74DHQvNx6EqF09H51nOukkxm9kxQ0/XaZeiDmOHTL4kgGnnlF02tSM
         dlIdx+DaId5o5SN4SxzL5uxovkbI2tW4gfTs9iWrDrpXJmSFQ8kujozsgbL4SpHFaln/
         iavrLlTlDcM3JUfUcNbFwZlHxCrXFjbYdZwChsxgG4M2zqPrTxzha1OvRARDcB5iQVvd
         zFftLUAFpbP8Zema021v9naDL26pSauAn0pyLcoLfafq/2RAgZVgyyPlQa/gI3kWtW2C
         Slucx641/n0GdnRaIDm2KSKuzqL0ABSsZian8kbnNlPeB5+OEdi9JLDjUFbmpJMKn27M
         9/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=PY5KrR9iMJ26IpdWUfDs9HsxqKRAuKri6MmYIkjb96M=;
        fh=HU7Q7rqC3NFQb3h0gh/h4Wy2dR7ichYbMntmJIEj9QY=;
        b=atTcqFpSwELv06Z077VvC5qaJI0fRYhYpR9xyiaPVPM1pXhQQXU7qi/cKxVxdDMuux
         WrMDVcGLLL3/7V/u8G8IdgeLhoVFcV9iSf9Kv+fXndPWUfgj87l+kgyGHK6vAhGIbkDS
         LHMLcxJEu7nsY5/ETlPVnEMYXZqv3CnLD5SXAe/H3ErNq9ICnyMqsT+WlX8z+jIDlg6E
         tB9Xk3Ld5LT96lA1mdKJ9vndF1/zzKS5MkfV/SfKtj/wYhFdSFlQO0dVizwTGtAKcwnS
         6o9/Nrqbc7Yi2qhnpnPEOrgWlNIKi1Nz2+od6DNaMrFBhLwVeps8VN1qcNUYlSN9Y0OK
         I8AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781389948; x=1781994748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PY5KrR9iMJ26IpdWUfDs9HsxqKRAuKri6MmYIkjb96M=;
        b=GLGr8pXwOItivHEOY2mmbNCom9ttUTtSrBafyR5Drw/Hw1swH3EA/YJUgUn1Oa8yEz
         L+09VoZnD6xw66PBmfa4zMAl7SZQeUzP6W8gTmTRabiVLwo5NV7QPn+ilmah57KFWLEq
         Jwik9IE1j+Yp/h3y0EQSVg7KQw4oL5R3H7bGyvTFgrZN3UmbcNuB27mgyzPyKpwdfOw5
         5rknjRpx8GFz2vpnih4oveyNLnDQV27FxfoQd0k61gDXoZ/nbPYABy/hjo+EecLKKB0P
         jhaNOV5q1AKCjwpXrfaQnF28kJBR9U/ysoCy/Ad/7yz+ulw9Ne9nnB91MTVV+cQIT7HZ
         20lQ==
X-Gm-Message-State: AOJu0YyWr4u//t/PmWf8mdJ9AYVSnISq60Am/z8y3qsPxE/MgxkkHPDk
	Rgeex1XDgsEFN8FtuTwh70hftlxFq3xxAqgYJdjsWNvBStTXLYXfgw8MgdsNr50MqnEvQvin6Id
	qMQgeGjt5LTeVb53jxOGX+OkMxCxNppoR0cxOtz5GlP2hWGmIDRlO+MeV3V2GKouhrTEgvr9l9a
	A+21Ip/8YW2KtIszhCxgBmjWM9eiwpdFcrRITscakn6fE=
X-Gm-Gg: Acq92OGTXXAwne7CuJBZkPbFjwD/1u6bT0uOiFcIgnmgE8A1z9FvnNodDxakgPxMkYG
	HUS09cZRTfExQPKhl1RSN3q2bs8LmUiIrCp+dS4/VPW40LqtA1fBBASMoPvGGZi6hgF/UurFiGz
	eE9cnFxUNUtQlOq4AP8kMsbTUVgbAh7zwqfQgvHt4sOx/NgXatFpYjZpi9Y1SgEKTiReFLpFjmf
	Z3gHtBr09RqEvTb3EPC4A==
X-Received: by 2002:a05:6830:2e03:b0:7e6:f7fb:9682 with SMTP id 46e09a7af769-7e7846efe32mr7148467a34.2.1781389947805;
        Sat, 13 Jun 2026 15:32:27 -0700 (PDT)
X-Received: by 2002:a05:6830:2e03:b0:7e6:f7fb:9682 with SMTP id
 46e09a7af769-7e7846efe32mr7148455a34.2.1781389947375; Sat, 13 Jun 2026
 15:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610193158.2614209-5-zhipingz@meta.com> <20260611202555.B0FE31F000E9@smtp.kernel.org>
 <CAH3zFs3FjiCfOceVRin0ytKNdZ7Pgyv4ds=Dd_GhrRC_XcbNOg@mail.gmail.com> <20260612105928.200220b8@shazbot.org>
In-Reply-To: <20260612105928.200220b8@shazbot.org>
From: Zhiping Zhang <zhipingz@meta.com>
Date: Sat, 13 Jun 2026 15:32:15 -0700
X-Gm-Features: AVVi8CcMGigExPKR8IpfZtGzrLOFWz5YTcGVhRoJFgHdM9ZEhG5IiCIsvSLW0hM
Message-ID: <CAH3zFs0nGMXV2N=6epd2-40D0tyxcXs8K0E7zX8-H1DcaDOj=Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] vfio/pci: implement get_tph and DMA_BUF_TPH feature
To: Alex Williamson <alex@shazbot.org>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org,
        kvm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=IZC3n2qa c=1 sm=1 tr=0 ts=6a2dda7c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=r1p2_3pzAAAA:8 a=VabnemYjAAAA:8 a=VwQbUJbxAAAA:8 a=vvh9Qk1aVFpNxidmG9UA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=r_pkcD-q9-ctt7trBg_g:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 2TrfuHfxKFL9AtDXbgge3tGknRcS0-sU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDIzNSBTYWx0ZWRfX61Nyrz/hkfyk
 de1V+8l9VEhYN6h4wya9mhLkCzlXnxTgTFdeNWQ/t3D/nbkTzB8VMwtmwK1A3kwEcMXPr+NqXd0
 FL6iV0Nb6nG/rL+br+ykH4JFe1oO4Uk=
X-Proofpoint-ORIG-GUID: 2TrfuHfxKFL9AtDXbgge3tGknRcS0-sU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDIzNSBTYWx0ZWRfX9a+mBHpmDxl7
 1FpmvA6BzVQBu53Q30/dq12EbtsluNddbTBW2W04PohW9aUImDPXhMF6vt4h9XRLPt98wjPcFR4
 vizIdf5EPDsYsBUcTOh/UqO6qYuNAP/RrBP12XSZZ6GYswYmx2iltki0GFpkjGsMJBqklVMLCrm
 LhYL8vLCRkoobw5u1DqiFbDFD0UVZRnzKmeFH4IpQrNsPMpgq6pd03kvyTnxsOtyD+zACcRVGy8
 OgMyjrzFmas/X0pWbOZr/EuMVuT8NpIYpNVJtQsstF9SULzTjWUs1I8HzUWqE7Pn6RbhYD56TA4
 7e5L7HkLh/SvlQxa5edM8IfjxVaTD79czHIqtTHf2D4ghDMmVdGjUPK5iuK5rMzGMO7hSRuiKrE
 TM/ilw64lGvedtS7gqvFRzPuCnS2lPZmFld4X2sNf4sZWO1ljJ96oS/oPbWdV/D0FkKhCctHeQf
 JkWpP0JoBG2Lu17Yg9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_04,2026-06-12_03,2025-10-01_01

On Fri, Jun 12, 2026 at 9:59=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> >
> On Thu, 11 Jun 2026 16:02:25 -0700
> Zhiping Zhang <zhipingz@meta.com> wrote:
>
> > On Thu, Jun 11, 2026 at 1:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [Medium] Unconditional validation of the flag-gated 'ph' parameter =
can lead to spurious -EINVAL errors, breaking the syscall trust boundary.
> > > - [Medium] VFIO_DEVICE_FEATURE_PROBE falsely reports that VFIO_DEVICE=
_FEATURE_DMA_BUF_TPH is supported even if the hardware lacks TPH support.
> > > --
> > >
> > > commit d57637d667ca6dc95def77a0a5bd339d62d4f506
> > > Author: Zhiping Zhang <zhipingz@meta.com>
> > >
> > > vfio/pci: implement get_tph and DMA_BUF_TPH feature
> > >
> > > This commit implements dma-buf get_tph for vfio-pci exported dma-bufs=
 and
> > > adds the VFIO_DEVICE_FEATURE_DMA_BUF_TPH feature. This allows userspa=
ce to
> > > publish TPH metadata for a VFIO-owned device. It checks completer sup=
port
> > > and protects the metadata under dmabuf->resv.
> > >
> > > > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/=
vfio_pci_dmabuf.c
> > > > index 1a177ce7de546..0a0705c8dbea6 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > >
> > > [ ... ]
> > >
> > > > @@ -333,6 +360,71 @@ int vfio_pci_core_feature_dma_buf(struct vfio_=
pci_core_device *vdev, u32 flags,
> > > >       return ret;
> > > >  }
> > > >
> > > > +int vfio_pci_core_feature_dma_buf_tph(struct vfio_pci_core_device =
*vdev,
> > > > +                                   u32 flags,
> > > > +                                   struct vfio_device_feature_dma_=
buf_tph __user *arg,
> > > > +                                   size_t argsz)
> > > > +{
> > > > +     struct vfio_device_feature_dma_buf_tph set_tph;
> > > > +     struct vfio_pci_dma_buf *priv;
> > > > +     struct dma_buf *dmabuf;
> > > > +     u8 comp;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_=
SET,
> > > > +                              sizeof(set_tph));
> > > > +     if (ret !=3D 1)
> > > > +             return ret;
> > >
> > > [Severity: Medium]
> > > vfio_check_feature() returns 0 for VFIO_DEVICE_FEATURE_PROBE, causing=
 an
> > > early return of success.
> > >
> > > Should the hardware capability check (pcie_tph_completer_type) occur =
before
> > > checking the feature flags, to avoid falsely reporting that the featu=
re is
> > > supported on devices that lack TPH?
> > >
> >
> > Will fix it with a change like below:
> >  -     if (ret !=3D 1)
> > +     if (ret !=3D 1) {
> > +             if (ret =3D=3D 0 &&
> > +                 pcie_tph_completer_type(vdev->pdev) =3D=3D
> > +                     PCI_EXP_DEVCAP2_TPH_COMP_NONE)
> > +                     return -EOPNOTSUPP;
> >                 return ret;
> > +     }
>
> Typically this is done before the check feature call.  Thanks,
>
> Alex

Sure will do =E2=80=94 move the completer check to the top in v8.

Thanks,
Zhiping
