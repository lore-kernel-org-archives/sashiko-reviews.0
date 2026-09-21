Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E23ACEE2
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974391; cv=none; b=fDgdgaokdBLW6gOo3gFSkkHEb819DHHxQLIAJ1Q6Mmvn5ptiI0qp5NQLPCRoT3IJLEp5E1j5Hc52/tHFw053/2tRC8dERJIKfYsFGxcX9p419A/uWLTpZ56NB0LDZjdzSbGYlDzCz2l0RNJHuxj7YSrOwvy/K3Zs3u9/0VI4cqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974391; c=relaxed/simple;
	bh=IYh5w+KxUAUA8iUbtSHuprwqVza+V9VJirc+X43mf5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHbHBrRUK4SPgf9BaM+odxfL/RcnPs6heSx1rBoccxneU/GVlM0L7m9sBGjVRp9cHY1uOAtILGowL185ahN9VfhFjSCO4Qo2X/ig2dYRxwv/kxOLknIBfw1cZk9sZhV1hzRl1afhzQVDw1uiX2QEPItHgwzx+g1nGO8RxeUZnf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzVJCakb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzVJCakb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701C81F0089E
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974390;
	bh=dS669YdL4HWYJMFHFuqUiLwJ+dBe/E6NjwQ/Nk/pJzY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dzVJCakbVvndGYTPoffC9/BBzOjv0OuuLWyNhM2cqnoeUPz+j3kaKJOg2Ng3Ulpi/
	 OUwKJDf/XbLgq/xbydxb4tVHHGEjq4K5NX4NTSzi7ekOAtUXh93zNeNQcirNdMSQC/
	 qgwtyW/is7d9DkFEp3EkoYTh/aG0fqU6Z1ZbLEgZGDyMQkSD4sEopBD++gKCIhxyp5
	 oevnUHQJOTp1ymFFvrgXGZeYcyNVXl2p9idu7/cguSIfBl5ukTlUM0D6t0uX+y9QuK
	 oor95CfEQRpTCnYlC5qMzeXmFazG6QZVe8mtQJ66H1OOMS+yz7TCLtTUULjPcxYQ3k
	 S9JoC0Hct48Vg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c3de61a3so2112627e87.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 00:06:30 -0700 (PDT)
X-Gm-Message-State: AFuF++kSWPlQYP+FsVZHwdGq6r51KpsY1R/8Mv+jGalP7IFbGlVdsRVT
	o6JSor+b/GstaxLQfcHPOYd+2Dimuq4MUwDjS1NEROwiLJielx2/Ce8kQ7mK1880vLHBKJtaiLw
	XtuX6T7WBf2DpUn4Ydaqq/WUbiREmVXw=
X-Received: by 2002:a05:6512:23a7:b0:5b6:1a7c:aa1a with SMTP id
 2adb3069b0e04-5b8c197cf88mr3053851e87.50.1789974389058; Mon, 21 Sep 2026
 00:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-18-9352be6b86b1@kernel.org> <20260920230526.D9E331F000FF@smtp.kernel.org>
In-Reply-To: <20260920230526.D9E331F000FF@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 09:06:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkazAsBWPD9vhh_N4fgsohDARUZLb72HMpfV4ZJvVs+6A@mail.gmail.com>
X-Gm-Features: AcwNN1WdHGAFgi49VdletBEx39eGC37Zp4G66DB5ah7Aob95Mw3hiURMbaajIF4
Message-ID: <CAD++jLkazAsBWPD9vhh_N4fgsohDARUZLb72HMpfV4ZJvVs+6A@mail.gmail.com>
Subject: Re: [PATCH v3 18/18] ARM: dts: ux500: Remove DB8500 EPOD regulators
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, 
	dmaengine@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 1:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Will removing the v-ape-supply property cause regressions in the
> ux500-msp-i2s driver?
>
> Looking at sound/soc/ux500/ux500_msp_dai.c:ux500_msp_drv_probe(), it
> unconditionally requests this regulator:
>
>         drvdata->reg_vape =3D devm_regulator_get(&pdev->dev, "v-ape");
>         if (IS_ERR(drvdata->reg_vape)) {
>
> Will this missing supply cause the regulator framework to fall back to a
> dummy regulator (emitting a warning) or return an error and break the
> driver probe entirely?

Ooops I'll add a patch removing that so the driver just uses the power
domain.

Yours,
Linus Walleij
