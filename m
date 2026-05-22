Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF13A6403;
	Fri, 22 May 2026 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436808; cv=none; b=CH2XX/omqBttRAPLth4xJqDUPEpDi/Rfs40Q0BhexixzR/PA8ihoCJMxt9diWf4h/Em6Yx66SJ6jlMKf90TVMw94lEB28OmlSD8c0ZeG7pp4wA0ljgHUWRK3aiVtSqwIJgLGr46FbUOHjUB/e1t5VDPAjAU/fJcmREaH5CT0H0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436808; c=relaxed/simple;
	bh=xsK3pQZpCJohLKM7UrVU8BbY2NcQEAdCx73J93y16N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdfxViqluAwG6qHFjL6VnTZOzrVBPU4GTekgZElvIM0Ll5YuBXhwEUKZMIK1T/Ss7UDA0Ddm+Nx7cXUkElOihIKVeXDPhieHYuqIUMPxX/fbZqnL4f7kE+BIkDHo8s3oPVv5M9ZsGyw4PhHKn8Ommvsc3Pcf5MUXs2O8UD+RlKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Idj8V45Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Idj8V45Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F611F00A3D;
	Fri, 22 May 2026 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779436807;
	bh=clPR+E9zimijMLfBFReBsxul5gYIW1YxjQhlTfLOb9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Idj8V45ZuU4mHBQSPARWKsyNzpZMN20Gl2j6bXORXdekPP1MSmP3FtBcJoi9DiOSi
	 B8/dOJjOR+5NxmXU31FmCsBE5cTO7IATs21tYs+lVn2XBNFvauKYYzrMIGvUrPSnAr
	 6bYd0fdslabm7laJEkDVXQQyJKTSHqyaxYw1NVg1nkS/PvL2x8meBQE66DbEVmW71n
	 RYLqdkQSsUMXu0+OUEpeQtNIZmoCvMIyaU9FoKyMXJ1ZEkV//tEqzKjRgnKfvEeYb1
	 aEFyCy3ANb77Bj5SA4ulrYmeIibIs9zqGA0LrfihxiGzK4KuJCZf1B3A7HoqIRwlBJ
	 CYiRzWHcb/1IQ==
Date: Fri, 22 May 2026 13:30:02 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 01/16] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <ahANAhccTR_zhY1c@sumit-xelite>
References: <20260518072856.22790-2-sumit.garg@kernel.org>
 <20260519073346.21BE9C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519073346.21BE9C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:33:45AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `kodiak-el2.dtso` overlay omits the `iommus` configuration for the `remoteproc_mpss` (modem) node.
> - [Medium] The commit message fails to explain why `gpu_zap_shader` and `venus` are disabled, and why `watchdog` is enabled in the EL2 overlay.
> --
> 
> commit b4ab2188dfbc3caab6111f1ec38bf830bc7a5ef3
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> arm64: dts: qcom: kodiak: Add EL2 overlay
> 
> This commit adds an EL2-specific DT overlay for Kodiak devices to boot
> without the Gunyah hypervisor. It configures the remote processor firmware
> IOMMU streams to be managed by the consumer rather than the hypervisor.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> > When running under Gunyah, the remote processor firmware IOMMU
> > streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> > managed by the consumer of this DeviceTree. Therefore, describe the
> > firmware streams for each remote processor.
> >
> > Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> > devices to create -el2.dtb for each of them alongside "normal" dtb.
> >
> > [1]
> > https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > [SG: watchdog fixup]
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> This isn't a bug, but the commit message focuses solely on the IOMMU
> stream configurations. Could the message be updated to explain the
> rationale behind disabling the gpu_zap_shader and venus nodes, as well
> as enabling the watchdog?
> 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > new file mode 100644
> > index 0000000000000..0b3a69a0d7654
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> 
> [ ... ]
> 
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1800 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	iommus = <&apps_smmu 0x11a0 0x0400>;
> > +};
> > +
> > +&remoteproc_wpss {
> > +	iommus = <&apps_smmu 0x1c03 0x1>,
> > +		 <&apps_smmu 0x1c83 0x1>;
> > +};
> 
> Is there a missing remoteproc_mpss node here?
> 
> The qcs6490-rb3gen2.dts board file enables remoteproc_mpss and
> configures it to load modem.mbn.
> 
> Since the MPSS streams are routed through the APPS SMMU on Kodiak devices,
> will the omission of the iommus property for the modem cause SMMU context
> translation faults and prevent the peripheral from booting?

Nice catch, I will disable remoteproc_mpss for the next revision since
it's currently not tested in EL2 mode.

-Sumit
