Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4F2D97AA
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781560433; cv=pass; b=sojcaz4k4tmTH7ZxYkIkcDfVQ1hfoD8p3rV+Ho8MiwBvjmdv7bmjtNdcaTEak7DBp5GvNigByXehfjrmmfrS9LfAlK0oegkN8cOpfhBHnjg7Hl/S5U7gzpEhVRwy2TIRvjr0lnxwyX+rSqhcG3SDiG4OQm7pCc8X7Paeb40smzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781560433; c=relaxed/simple;
	bh=MAw7xAS00Pxp7lTFSZCtf6qTpMGHE7iw4QUCdtuTrn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdKS88XuCQgDqQRTlZXQLACx12FPdf6I/8+kAhleLu7w+0w3sUsqFdtlqtf1/znAzFnaUcFtne3pi5J5WHDUOV72IQOrMldluOhSvuUaqdG8AQs+hEdrsequWSRFHFblWpnh8KVUaITiRT1AQGBRtVzHOwow7+Fg29NX/Als6+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wR/5i4Xo; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wR/5i4Xo"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-488b3fd8d0dso68547b6e.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 14:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781560431; cv=none;
        d=google.com; s=arc-20240605;
        b=gckA/P6CSCIOWkqSxiVgAeRTu23oDTcwK5Bg1r0uvHZB3SWKe2igOmS1dr6oaepkQk
         OYyZM5db8/4673uRKkgpzTkbQV2KZ6Lhqhhtv7f/w/RfnGfB5mc2heHntNblCAbCVLrL
         VUsWqKu9OPD75/O6PTnYBPXSNmP002ogahGUkTYN+SSNV35HoEx/2TC7NkCKk+knV94B
         TQjPvY2buKqca6Q+GiClLxNIjOlCmbDnvNGd93vXry2iAVdtwA8jdmTgwublYpPlMmFc
         BK3xHcz+xpDVlgws8AM+rBxdlYQNfxXDIlHddWunzSJC6b58P0yYFNNmgP1dkw9U8vwF
         z3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAw7xAS00Pxp7lTFSZCtf6qTpMGHE7iw4QUCdtuTrn4=;
        fh=ckBl/s1LLKA3km8atbibBY7xTgAiKuqA5kAhDce8+2s=;
        b=Yxpune7Gh2H9957rDC1/1zH+rN3JYMrbj5wYQMlo2k6vh5DnUYChOmegwII4h5ITSS
         /0Q4GGUBJeE7DP6SjQej1RCx1MYnNEWvDngJWrHHQQoS1bCBvWHRtM03h9Q6ox+ANphg
         i9Y9rRlYscNYQ49ci/81Erx21tjdq/Efny2g5KvASDHcn5fupLhspBS3xyOflElCfxIe
         5nLry0/NqdiYHnaCvHbeB0nhzaeyMdIIErQtSX1Vo2G5TqvM3VtBUTHsMziHieyA1h/n
         D9lBpYYTuy1ARfcV129/TsTKqPJ5Z1nhKohqM0OT5ODJhdqdWQ73JCZdip+1NEgtEf8A
         3G4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781560431; x=1782165231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAw7xAS00Pxp7lTFSZCtf6qTpMGHE7iw4QUCdtuTrn4=;
        b=wR/5i4Xo0xAcFdpk+Tqxb0vS84Qc/F/hcj1UL/hIG5jc3P1gwnVYp6lqQZOZ7Fh/Xa
         bgLF48SaOKYUBL3xlhrmBxlUcS2b7QHO8D6H6vMCsYqlLnQCfVsC+utbmdMcPkoiiOjh
         39fJcskTqisuq2RYz7HI7G83h9v+Ut3KShPh+Gyr/iCZhbmbk7J5PPw6qG7g9g0JA5ev
         lfgmbZOdYTQyUdlxyfoy0rqkk4bb73smnyGflzmAKk/KPWJ/iQtv12bvhaBhMUCjUG3Q
         fQlYj4rQENImDerzAjMG7jYatV+WxuWHTYFUHf5nRd3f7QQfstXhH+hyPkfSr712bBX3
         clpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781560431; x=1782165231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAw7xAS00Pxp7lTFSZCtf6qTpMGHE7iw4QUCdtuTrn4=;
        b=oVCYXF44nYcvry38dojs6pzBkBXJn0vUkvNBlyWzFg1P4mN3Y6SgO/Gekb9h9ekpNn
         pZW749BjYxCDlTYOOIZGdokBKpLsmtgv5c2eWA+N24PxoFRPnedYE1j8ayMaE8EkJfj3
         oLjPvxZsAiW9MlNMSue0FkTMIyJYis8zkppzIrMILjJ+2rSI/XdFQJ/ZlEs4QpGBaEp9
         +FCwIlt8bku/kpTbpmqLwTJEfMCrQSr1aeOVWJyIJ5uF+zHLkwUQp61M+ebIiWXmYwk+
         x1nll/Tz64gyplTxX6c/LGtp/CHOku5kIMhPY7CtJRqfhfExOxP0jhlKmpCCdgteoC8Y
         Mp3Q==
X-Gm-Message-State: AOJu0YxZOTxBq3rlq4Qw4R8+fTHV05GcLttf/B+OsN8Oj3+0TZnFHfZQ
	6qjjA/aov71/jpUfoTDIuQtdMsr1AFG05nFB42/oGKao0zDJdP5Mv+pghbLgIO6zJonQGRqBCUs
	7XXrTtDt8HEwzf72qUGj22GITj4v4dNaojSKTOgsiJEXXqfCyJJ/lFv3O
X-Gm-Gg: Acq92OFydyvUKZ6ZwyrBtxx4/x/moPzntR4NzUkCaKAONxGHbIGUt6Ts9qObW57x2DZ
	Q4logOXGDCCnr2a9JQi2+iCWh2pFJjRdv0kTJA64m7ZpAFn3Gqul2xXk7ZlrfOs76vNslzgjKnQ
	BZmVPEo7Wq63xzYSPn5VzjayusdEM+YnZdh9URqpQNp3SZRvUqhuWeL9xH/Cu+RGl8P5dVri2wz
	VN3MPmCzKNaB9HcddUQqQ4UY8idG5tSgWYgJVBCgsLRt2ReezEMzbTsjosapmdbQLPN9oM4LHIH
	TEJQQSwy4U92OOfqKZf1Cgy8ADdkARwceQ2MhQ==
X-Received: by 2002:a05:6808:170f:b0:485:15bd:60e8 with SMTP id
 5614622812f47-48741b51368mr7889705b6e.35.1781560430903; Mon, 15 Jun 2026
 14:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615180556.4048184-2-rdbabiera@google.com> <20260615181706.37CEE1F000E9@smtp.kernel.org>
In-Reply-To: <20260615181706.37CEE1F000E9@smtp.kernel.org>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 15 Jun 2026 14:53:39 -0700
X-Gm-Features: AVVi8CfdaUv4C0Jec2nygNARmn06gsFvMFXSZkGy4qWWVfVu5cK-IRmgwemhDeI
Message-ID: <CALzBnUE+pDfb2XhPeSb=6ihi1xPt23HVSDMs47XZmc1pn-y4gQ@mail.gmail.com>
Subject: Re: [PATCH v1] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, 
	neil.armstrong@linaro.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:17=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> Does this missing update cause USB3 signal routing failures on orientatio=
n
> changes?
>
> When the Type-C orientation changes, google_usb_set_orientation() updates
> the software state and calls set_vbus_valid(gphy). While this was suffici=
ent
> for USB2, it doesn't seem to reprogram the newly added USB3 TCA hardware
> multiplexer.
>
> If the orientation flips while the USB3 PHY is active, will the hardware
> state miss the update because program_tca_locked() is not invoked, leavin=
g
> the TCA_TCPC_CONNECTOR_ORIENTATION bit stale?

program_tca_locked should be called if the phy_init and phy_power on sequen=
ce
are completed and an orientation change is made. I'll add an internal phy s=
tate
enum to indicate when the operation is safe and check in
google_usb_set_orientation.

> [Severity: Medium]
> Is it safe to mix goto-based error handling with scope-based cleanup here=
?
>
> According to the cleanup subsystem documentation, usage of goto and clean=
up
> helpers like guard(mutex) should never be mixed in the same function. Can
> this create confusing execution order and resource ownership?

I'll remove the go-to statements here.

> [Severity: Medium]
> Are we missing a step to revert the hardware clock request on the error p=
ath?

set_pmgt_ref_clk_req_n() will reset on the error path as the HW is powered =
down
and powered on, so there is no concern here.

> [Severity: High]
> Is this hardware teardown sequence in the correct order?

The teardown sequence is consistent with our requirements, no
concern on our end.

> [Severity: High]
> Will this unconditionally time out on subsequent power-on calls?

phy-core documentation indicates that power_on is called after phy_init,
and the power_on callback will only be called when the power_on count is 0.
In addition, the aforementioned internal phy state will prevent an unnecess=
ary
power-on call if the PHY had not been torn down yet.

> [Severity: Medium]
> Is the usb3_core memory region actually used anywhere in the driver?
>
> This maps the usb3_core resource and aborts the probe if it is missing,
> but the resulting gphy->usb3_core_base pointer doesn't appear to be
> referenced later. Could this introduce an unnecessary strict dependency
> that breaks the probe on older Device Trees lacking this resource?

This currently isn't being used in the driver, so it will be fine to
remove it for now.

Best,
RD
