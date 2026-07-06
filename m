Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7942E8F8
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377845; cv=pass; b=C0xQoOV1mgxrQcZxmUMPf+KfdrkGsZ4lS/qqMlkIYnt7THyOJOS00m9iYQZ/WLw2MZDTkBYQFLWT17D36SS4qnK4i7N/gRqOXSREO82ObtrVx2VoMfWHd280tgSvnxaJ+8mjtoEVMWkzDzO5fu7lN7itIt9fMrfvPT1QYLFw+0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377845; c=relaxed/simple;
	bh=e21olkonylKNoZ2+fFTuNNuCEW6VaSBhZ7Yyu3P4P3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEEy2ELGzjA7ZW6Gby7PXWApJwjN2ANjz8JtqJVo5SKRc8CP+r8cDyobCwV5763izTWej7G6qdTOUkn6u3mpfYzRYPtnM6WWRjCjKWbTZajy7nKiTvivT2de7sJ8oKXWArpdkooQ/UQn1OU98GLP2mB1tLc/+ofr/U1o5ttFEHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NAw0QBVB; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NAw0QBVB"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a116bd18ebso1766883eaf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 15:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783377843; cv=none;
        d=google.com; s=arc-20260327;
        b=Xq2bkagkL3WF35czA69ikkqWZUw2mYICbBSrXcHRz1XcH4VGdi0GqDsC6RmgK5ROAO
         F8Ro1ErRIU9wEp8Ycq9iiCeLBjfQI+O9osh2YBCXn6HXi5tevaX6XuAz2JJ563Hml3b0
         /lWC5dPPDHazdqM5k3A1fDbOxhU5Y/1/EEhuuIyJ11AH0ETFVQ3c9ywWzCabmda6Y2zB
         7nkMxzh4+9VTRM14QMbOO/cSyomhtuYT1++VKJiD/OTRTZyBSqZngtGiuTgC6bx0Vdu8
         uEkPO4jONNDHG9a4EGbC0nGfoB5AXb8UcXclkNRKuj6tEN/IYBnRyqZMQ1y75jhIYZuz
         ulMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yx74mKYdJqkO2FUcIAj7kyzeQKoLU5qySEVSk2mMPWs=;
        fh=BD+BcTxYT0SzRupK6ziCFpHK0dkdycIDvFW9bcqfue4=;
        b=o2YzgC+xum3lOzM6Uw7k8/1lLEceqT63kxxTIyeSdWASBSaGhyRj9nZYu3XGbIcIxI
         ObzRAoVcDiBEK0ymYxc8gEoBrN3BZNO79QpRjOWm9HRmIVypkBYpJKmrUXPUm2qPR+wd
         SyACyTV8OEOaKSJbrii1SPLFkIUsuOgWmFsvi0QX9m3BGiiG6iF8OSMa86PHzGrXjRHP
         bk+cDtI25Q4jSdzP2i6boXawoiaTRFUnKa7UchSjLIacIadEyztmaSZ/u1Waj5gxv63e
         PPFAeon/LJVllVTUReH8DfsTOYSy/PD7TtXk0wLhe4KhU7twCNe9d/T6Gw73RTv2zAY5
         PM0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783377843; x=1783982643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yx74mKYdJqkO2FUcIAj7kyzeQKoLU5qySEVSk2mMPWs=;
        b=NAw0QBVBprMjPoH1le3EuOQUxTPDtyDWYRPKhYS4egSoeeVHtDo6gZg1fe3I2i4K1x
         HOmhoyy2kVuLGEYic2hoSHFob0pIDLK04HPaErEwDtQWfQPynS/nmpKddpYRTz+wXUng
         sfJF+xAugMj2ptPP0K/Yt3xrLskCOhK7iilgnkPNjtE678OvsWsjkf9F6w6+jV6FbjeP
         0h46j7nZYKJSvBfZoMNwAKJKnejFHRwH2abo4XsM4PXi94itx1SyQC+KdunlkgfWfU/x
         /nIDcfu1UafxL+2haw+loxiuLBo0fc5bX1Hcq03yCETrEjk7nt+Ro9gkwwMYtwnvcKAX
         tKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377843; x=1783982643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx74mKYdJqkO2FUcIAj7kyzeQKoLU5qySEVSk2mMPWs=;
        b=iYOp6DYiIgXb9HMJtlBgAcDtn38pOI6RZdrsaS3yPqt2KYzuHinia15aX0dfeFpZTQ
         +vfg9gTnn3P4ukUhYshMju3B8C32molcrvhCDF7sDNiMTMB6ugqtMjkQKZ1msYNvYgMS
         97HO+LfTGZZ4oSXidskOKSCaeY8L/y5U0yYEmzKWtNtifuJrAOZKW3+vgwSNSg8u7TJD
         VPMndLA4dhZROIcQQ7Tb69Rs+lyfdF49txMyjSq3L3NlwfOKTeKpGmI4TAZ5ymPHAQ9D
         ouMJtMkPT/RUponhXS1NRgI71+VMgmbiF67J5zd+Fbqzt9L+RFH7C+kki1s/OPbE1iqK
         Um4A==
X-Gm-Message-State: AOJu0YydVIhT/AB3p7WLrcY6fqdL0XaYbY7pVreGoMtQyMT61IL0EIq6
	a6uRqD5rOxWB1MVFJyySsGbRGSExlY+lWn9UTNYXDm6kVjhi7dx27fLnExmtRYo0zAmBH5Hd9dD
	WRr4hSDLFt1oukTLmBVeuN069s1fTM8zTY5xx5DkTPXGNmc9+l0r+jSPz60Q=
X-Gm-Gg: AfdE7ckowdlJ74b7EbmvjZEYdsQZKm089zo+aPbytNc96dT90g4rrb/KHlGmU9LacrF
	Irrde9rjuPZn43e7Y3qfHQ+6Y+eqbsEl4Tor9fFQR7P6r6hQoQ0vVUAg4J22UqsQa4wFGPYH2Lz
	jrGGWIFpfDCwAaZRvP2bK66LQQr7ZpFEGC5Bey90Le0vojSQMcHnAD7A8OLqkzJrlmQDplcTbLS
	EzFdCfOIgMdBNna9c7B1aF4+SD3BOGVTpxMZGzfsr9EiH4cYWbN55jjZsLXeaxVOni9hE6hDhc1
	O+LqdF3Ycw37JwgKXS3f4F8HkPk4gSE=
X-Received: by 2002:a05:6820:1392:b0:6a1:8223:466b with SMTP id
 006d021491bc7-6a355504c46mr1874256eaf.28.1783377842141; Mon, 06 Jul 2026
 15:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701022827.785674-2-rdbabiera@google.com> <20260701024002.DB4E71F000E9@smtp.kernel.org>
In-Reply-To: <20260701024002.DB4E71F000E9@smtp.kernel.org>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 6 Jul 2026 15:43:51 -0700
X-Gm-Features: AVVi8CfUsgnGHZq-c3BxQdwCm9qIfw2Qtbp7kwS_ksYMx_hhFjYJQvUN7HwDsVc
Message-ID: <CALzBnUHDyYe8gJbKGNG_XYS6Fv016JdtbpfGX-4DHwd-7vY_+w@mail.gmail.com>
Subject: Re: [PATCH v3] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: sashiko-reviews@lists.linux.dev, 
	Badhri Jagan Sridharan <badhri@google.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 7:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > +static int google_usb3_phy_exit(struct phy *_phy)
> > +{
> > +     struct google_usb_phy_instance *inst =3D phy_get_drvdata(_phy);
> > +     struct google_usb_phy *gphy =3D inst->parent;
> > +
> > +     dev_dbg(gphy->dev, "exiting usb3 phy\n");
> > +
> > +     guard(mutex)(&gphy->phy_mutex);
> > +
> > +     set_pmgt_ref_clk_req_n(gphy, false);
> > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
>
> [Severity: High]
> Is the manual teardown sequence here in the correct order?
>
> In google_usb3_phy_init(), resources are acquired in this order:
> 1) set_pmgt_ref_clk_req_n(true)
> 2) clock enable
> 3) reset deassert
>
> The __free blocks in the init function correctly establish the error clea=
nup
> sequence in reverse order (LIFO). However, here the upstream reference cl=
ock
> request is disabled before placing the hardware block into reset and
> disabling clocks.
>
> Could disabling the clock request before asserting reset freeze the IP in=
 an
> invalid state and prevent subsequent wakeups?

I've verified both orderings of set_pmgt_ref_clk_req_n in phy_exit, will
change to be consistent with phy_init ordering though.

> > +
> > +     return program_tca_locked(gphy);
>
> [Severity: High]
> Should this check if the Type-C port is actually connected before calling
> program_tca_locked()?
>
> If the port is disconnected (gphy->orientation =3D=3D TYPEC_ORIENTATION_N=
ONE),
> program_tca_locked() falls through its else branch, configuring the regis=
ters
> for TYPEC_ORIENTATION_NORMAL and setting TCA_TCPC_VALID.
>
> Since the Type-C switch callback google_usb_set_orientation() correctly s=
kips
> TCA programming if the orientation is NONE, should a similar check be pre=
sent
> here to prevent enabling the SuperSpeed data path for a phantom connectio=
n?

Will guard behind gphy->orientation in next version. If the port is
disconnected the
PHY will be treated as being in normal orientation, but given USB mode is b=
eing
programmed here and not NC, it's more correct to only program USB when
a port partner is actually connected.

Best,
RD
