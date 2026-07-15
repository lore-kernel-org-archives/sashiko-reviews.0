Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA723BFE3F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145325; cv=pass; b=Px4vGSyfqzusJYOzmnBeqXXNR/Hd6OrqEYtjJmeKud2kKUjHtDAOdmnLPmXJ0tbhDM4FGETYdliIuIN1b70hyhN3xnwzukEaEAaTBPMWRZxkCnqkapmvi2ttc+KSV0Wk/uZMHBXPyHkYrleFivAG78THk+ALHwPS0cmfUD8qODA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145325; c=relaxed/simple;
	bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DN28wLNNqnBGQnJgdan5fcUTxeMmOi3LRuS/AXg/UpklCqcQ7i2DCdtoo6mp4b+EJZc3CRrtMHfwcZMmzhk2vv9xprTN5qcqAkRiUEm67E5BxzX1f1+IE253/x0xZ6MJIi1mxw7y2obvcwVhYGwY6dyOrcE/NHR41WpiItXN0sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmEaRfQt; arc=pass smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmEaRfQt"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-695f66871b8so5196305a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145323; cv=none;
        d=google.com; s=arc-20260327;
        b=i92IVt6kSJMlZQpx+jtH29q/1ZpgNHLcwefMlMEMffxKlvebZOafNcxl7VmQEJOg2H
         gS7OueBp1gTYA4sSTSBCpyq+LcvipGDGnPMWKOU7NJfTfHrArdjVrVbkqPkHbnF9Qy44
         PnvRToZbbfpPibaMArLzMPjhwnr1JHdCdKigj99oaQEorCE+I3uI9Pvqw9r5CPo4V+7/
         RODsov2YX+TMBWIeMjsHDOGyXs4ZaEY8FipCKm8E5VBBs4IiYO7aulnvs8zvHhsLZ2Rr
         DIMWXMIkrK2zRCStnYobtOpB9dOexqW8yKR3hLwWSE9rrKx6wvJQcHwAuI/EwtMLyjp/
         gb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        fh=rvFkOP/AfMR+icw+548QpPRYAafiU+7XfAwymfl22vc=;
        b=FzMYtIX1O63+cNHMoV/oBz1WRI1JiDpgkxcdj38rU7g019vHtzrq/hBGlWsNNHXfV3
         Ns0egZmBtlKm7ZcocObZesuB+Ut2itu02XfWZ2Pz2ToNtg8RIjukUywpg71hr5ee/Je1
         N00yttD4SCciQjyTL/SYeLJWTq+t1MCxFPHjt+gvDas6Uyp0Uq2IWuvHzGJD9KCcx7Cj
         77tNKl/0/i5RJ4idb7rWG/rc1EJjYMCzBinbXM2LMwgFrrpWLouIKiynj/d/0upGxDHj
         PryU0gqpoakc0WFYoLAs3xIpUlsKErQKw8DnBIJSxTB6oDPcBFKvnfMgsjBObSWJCugO
         oAkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145323; x=1784750123; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        b=CmEaRfQtu7hZ74MZBKYOcGoCK9oF3sL9OE8tndYwdXLPKEVzRBV9D7Y1+oNAXjfST/
         Kj+yTL5U6t0D8INKDbszpKoRBTBlVOAdBe/tUv+qjtS//gs5h6p8ANeGrF8Z9q3QERzg
         7B5c47HlOQ+T74uraQZiDD9V4yW9OhwTGNB2yjUfnQ9pIsEPn5ox9ZYwwAA3RWVvhig7
         DMuOuLo5cnVvDz1iwoB6DebwMjCwMN3G8zYTZFJbSguiYaQL+eS9cunxpG40W6iMIWQd
         6mnXKSbqpu9ylx6bAl9vxlwjCU9CQdkBb+mlgrvyt1VF+MHesDN0RGDw7ekIh1hwHZvn
         luYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145323; x=1784750123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        b=Oa73nVVX5cbAqaqxKlzovmOylNS2UaWkS50kF4sSJEWCmaUI+pSK+vuhqhR7zNNRek
         ZbcKMI7IozGooYRXGjYlKIV8W6036q10AQmgqIMBa6/I43q8oWU3v7tH/DQWa8GW+sRL
         mRpIq78vpfLtIl0rylTDDkUkkukt20M76ss/4bOHo1zsf9HQsDJ016bEEeID2NTpwowV
         Fa/e1YNyBDlxbNGT/eRW3rkxwppjs9X6zwi3staLa1uBf8k57/1ssNJAOCRTsy3Aog9Z
         Uphs1/Hwqex/cmzb24qAlwSRi2yZwSOtho2k9C+hl51d1wb9KytIPsMd9QZyQR4qfODJ
         KxfQ==
X-Gm-Message-State: AOJu0YwirBc5RezbpOASaa+b0ER3zlJjsbT/6mJxRKNlfUpTBKk+sF5N
	e2pS7b/MJ6TvFveC4K4S9az3rMcEUtA9PIXRbH7cRtXB0tZjRawB6Wtud4RXr4m6VpugQ66KxIC
	Fgi2IZn21hexvE40GYb0ffAIJe5jz1DswUfeNjdEbqcicw08=
X-Gm-Gg: AfdE7cnFFHBfHY/UkxJC0h1V7eXb0lODqQqO3Ni4R/aQeCTaSAJKRLUYi81aiLw+mvZ
	cx+Ev98aBKm6bdVg0r8xh5tFZ15iaEdT8hCPkDgQ40xBmFFmjRDQDdSr8fZ0sOJeCXcEFnZMv4+
	fY3dTUZtCj0ItUZEzKQQomprt1KAWAzywJji0d9OK6R18GwhYZ23+u1CufQR0hgn9mP3i9KoPo8
	k5k9pMgsOsrPVvTZC48kXCVC8rDF1ATHGBrqRmo/XPgK/roKIrVc0SnTrnX6BUTiPaIweOnCKo=
X-Received: by 2002:a17:907:7242:b0:c16:6e57:9444 with SMTP id
 a640c23a62f3a-c1679453361mr272846666b.39.1784145322452; Wed, 15 Jul 2026
 12:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-4-coiaprant@gmail.com>
 <20260715191450.5784D1F00A3D@smtp.kernel.org>
In-Reply-To: <20260715191450.5784D1F00A3D@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 03:55:11 +0800
X-Gm-Features: AUfX_mykLonGubsl8DxO-GKViagbh7KP9J0DCe96idGn5m70wlNIm0CCR-zZt1Y
Message-ID: <CALj3r0jq7F5HvQgpA_kq1+=AzMT2y2sG55TfJVWvWTZxwCbK9A@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Does this break device tree backward compatibility?
>
> When the rockchip,sgmii-mac-sel property is missing from an older device
> tree, priv->sgmii_mac_sel defaults to 0 in rockchip_combphy_parse_dt().
>
> By unconditionally calling rockchip_combphy_param_write() here, the driver
> now actively clears the MAC selection bit to 0 (GMAC0).
>
> Because the hardware reset value is GMAC1, this actively overrides the default
> hardware and bootloader state that older device trees were relying on.
>
> Could the code check if the property was actually present before writing
> to the register, to ensure the hardware default is preserved for existing
> setups?

Thanks for the detailed review. Regarding the backward compatibility
concern for Patch 3:

First, the driver code in the RFC patch set has already been revised
to align with the hardware default: `priv->sgmii_mac_sel = 1` (GMAC1).
So when the property is omitted, the hardware default is preserved.

Second, and more importantly, there is no backward compatibility
issue in practice: SGMII support for RK3568 has never been functional
in mainline before this series. There are no existing device trees
that rely on this path, because the PHY driver simply did not support
SGMII mode at all. Older device trees either didn't enable SGMII,
or were never operational.

So this change only affects new users who explicitly enable SGMII
and set the property as needed. It does not break anything that
was previously working.

Thanks,
Coia
