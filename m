Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AF54B1DA
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924559; cv=pass; b=ZnHSEWbwPkLvDOlHh1Qs8GiU7qL9LCbWqD3JdGPXs2WDgBb71W0Q++k/uaiNC1mMBC3iokPlsv04UPuiqPCh+aZ4bxR8Y3RYc6kZfeAkdaa0ixm6Dzgcgn+HsdiOJeKMfC+6/SsyEWL2SGChqvQYNIpdX+s7lQAoME4wdpm9QlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924559; c=relaxed/simple;
	bh=N4S4WhX9y1egfYubZD+cGlmH0A5CORT1pqeSQxAxxVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbjUeuHN717XgMyzxwn/mUIjKJ9WGWxZbUkzI7E9a8IX4mz7arFnisaaUFnFFFhpuuWYIoFVTPvj8bU/TN+4BsV7dh7nhgtVi2K7DtsXST/9PwTXNqsAe+HvBtbPOf2l6bP/Mwwz9AqZQFrXzlj5uFyvzGbMjuWTQiZvcnCtTnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gdk0PvkY; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gdk0PvkY"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac525c1f05so3980107b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 13:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924556; cv=none;
        d=google.com; s=arc-20260327;
        b=H32f6Kr+/q275a6tAzilRAHyQ9nuPjLI8cwSvyGF9gpH2AzDTr9cpxw22y0Opua4MC
         B+3CgoYL1oVN9kgcKml6YDZwF6/BBUpKXrPkhYPxkDpiZiyr4ITvApIeKjyQEntFodmB
         5TO0FttnG4NI4tIQewFSUMjupXTtaBbPcti1n416BQ+ZBILuiMQerqYcuOXUmNG7Gg91
         VB/8amhdDYOkI071R0T3PEZkcQ+4DLzUIPHbvMv1S3OOki1WBBZTD7LWkNMbmeWEMUH/
         b4rl7Hi5Bi/JQdAwjzxe9hFCEABQcMNVHOULNLRLe0+llpnS9n7fOeCafw4WFJZUuIBX
         H17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        fh=OJkDgVSvq2vyXL6vmhXid6GCfdVOaL3VDlnWJfP4tjM=;
        b=BDjKR2Ti9m7/+7LLJTOtpXJb+juxmbLJFquO6GQUadGtNfoy2jghFeDRid2VDds584
         KBQEykOQzZJijJeRNB5uogYBdGsTO2+WpY4BJRUcGxkRcl/NWYoxY84iJwMxCYtuA3sU
         CBChzfHtpwORVeR9sz5IfVWbPcD1R6fHYqeAf1ISyxd7BBgXUogDDN76wpiuAuXPZJPb
         c7nEWUwZ5u9gr4F2akjPq2GnFHWP1MOEbqdKsSu3v4vyeYl0pqj7XNH/Js1Tm94NIPdn
         iW9DpcJoQsWEEz0hV+ZyAq/AM4XedHOX30bmU9bQRZ/0wOW4hhYUzAlXcN9WX3Hci/PV
         yEPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924556; x=1792529356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        b=gdk0PvkYLy3pmMEL9J/+3jz5BRXF/AaFw1lHhDp7NI6lEyU0ii8JHUndJKfvaoqfe9
         O+Bd5vq6rop/8MDLYUkGSczqHB1gvcuDufe/WOcdpjUFb3QUWN0rIHnsxfKu6TFxIc3B
         N4qQUpQfaEmBPGIXSwjPGsm1BdB8ChUwrSoaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924556; x=1792529356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        b=N1MCpeM7qciCcCkxSHQA/E03cKNnk+GkfLu6tL0CdeG6pHowuKnGYMyImlrsmOJfs6
         Yzvi/HhGCWKqOry8jBMbQBunEOwdIQ81HMuVKxgFm+prAMN3rdJ/ZHtcHRKFI2pY4tkw
         Bq2OIBDuAUA7YDWP/Cw7JIxlIa+awD9lzVt2jb3iwxMPzl8nzpY3104e9Dz/QDbWTKFE
         XrwTU4AIvqKQiWVkofR9+96EjmNwpGWbMNVe1Hl738vdQw3nPpAcP+4Juahhl4r94aDI
         z5h3Mtq/W4r0hFGQdi8hpuW5JtcK0iHDAFcxedIoBdMRMtjFqDiOq6JxyzQygGukfeUy
         /iTw==
X-Gm-Message-State: AFq9FYLW64lpBGqx3iHcsB9+nFITyohbQPuApXlZDuVU6MnY++Jc2r8u
	w5pfSTbSYLp53UwcW2Wz+iaSQLQzjasGBJvPYpskLKuM4cfj/7cx5ECrVIPFa2Dmw3Qwv1l60VD
	HISgWmOLtDlJeV4P8oPYWQll6esqs4fhIWpCHozYr9ozoRjAqRrG7OQ==
X-Gm-Gg: AYBFou19ksJEhNIOXEF/FeLyKdkUu3PdM2Kb574PEDD9KwKotbYxYH5dQ+wEB31rL5X
	Z6rTZwGYlMJO17gNKewSDD/tR0u7Yw00zZYr06RNaGhX0sitz7qlEnDxEEgNfjL/4DrQoOKeUAl
	E5KM7qfwI7OHoeCiQik9kEzJFJuv4gYK5T1MbcaDdBpXZeklLQpMyK4NRSoVKviPuSyvFvBzyCx
	LcsefAfghTgQjlV9A7Gip/oe7twQY75Z9vaR5pznh1CsPRRjFUoC9eNeVMH1PBe2SfkTXIgH9o2
	rliUW9iii0XyImpv4Uj6UQPyhPQkJ9K2oeGi3rlkcXNBlgMt6OSJQhG1ebb5HDsx6fyBdaRvzSQ
	KXi7okdDT/w==
X-Received: by 2002:a05:690c:c513:b0:8b0:a8cf:f424 with SMTP id
 00721157ae682-8b0a8cff8d1mr29927657b3.41.1791924556355; Tue, 13 Oct 2026
 13:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-1-384af01da3ee@chromium.org> <sashiko-outbox-166133@kernel.org>
In-Reply-To: <sashiko-outbox-166133@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 13:49:05 -0700
X-Gm-Features: AclHuK9FMbu9JZUnRnsoojppgwhlqyo5kwjgao5eIiFBqF9-3uTME2iK-puHtSM
Message-ID: <CAEe3GZGi02TbXmPzFKKdf_nU0qejx+xeRW_2xKQ0B7RTk-VqEQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-input@vger.kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] hid: documentation incorrectly relaxes asynchronous requiremen=
t for output_report
> --
>
> commit 6d8fa62fc058c7f5630a13cc92c85b7867bc9869
> Author: Jarrett Schultz <jaschultz@microsoft.com>
>
> Documentation: Correction in HID output_report callback description.
>
> This commit updates the documentation for the HID output_report callback.
> It changes the description to state that the callback might be asynchrono=
us
> rather than strictly requiring it, citing i2c-hid as an example.
>
> > diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hi=
d-transport.rst
> > index 6f1692da296cf..2008cf432af12 100644
> > --- a/Documentation/hid/hid-transport.rst
> > +++ b/Documentation/hid/hid-transport.rst
> > @@ -327,8 +327,8 @@ The available HID callbacks are:
> >
> >     Send raw output report via intr channel. Used by some HID device dr=
ivers
> >     which require high throughput for outgoing requests on the intr cha=
nnel. This
> > -   must not cause SET_REPORT calls! This must be implemented as asynch=
ronous
> > -   output report on the intr channel!
> > +   must not cause SET_REPORT calls! This call might be asynchronous, s=
o the
> > +   caller should not expect an immediate response!
>
> [Severity: Medium]
> Does this documentation change contradict the strict architectural guaran=
tees
> of the HID subsystem?
>
> The HID subsystem design rules mandate that the output_report callback mu=
st
> be asynchronous to prevent latency spikes, performance degradation, or
> deadlocks on the high-throughput interrupt channel.
>
> By stating that the call "might be asynchronous", could this inadvertentl=
y
> mislead future transport driver authors into implementing blocking,
> synchronous callbacks where they are not permitted?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D1

The "must be asynchronous" rule doesn't match the in-tree transports.
usbhid and i2c-hid both block in `output_report()`, and hid-input calls it
from a workqueue as a "synchronous output report". This patch only
brings the documentation in line with existing behavior; the actual
requirements don't change.
