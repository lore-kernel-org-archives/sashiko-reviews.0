Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B223C76A2
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539265; cv=pass; b=OO7yfDItLyAJMj/lQyrCiJ/9OzKD0CC3jNecldbUcT56zeD/5jDaK2cK/3Z3cPpGbmjSTaWMG/epDfW/enasirkVJVyZ7PZmaUgbaN9z4z/FHDuveAeT25tSxr6ZWEmwIB6LDHx4f+TaUt4RZXJyUaUnO0TH1N5UvYUZCuAv4/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539265; c=relaxed/simple;
	bh=nVoTWQyfEHYdtxuskiX83mBuE4FebcDcTS0211N/3T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGMeCP2h/UgChhHMLB8wnskMaoGqF/MgwYLTjWrqoeM93+cKkbI0364WdRTp/BAOBH1zjDa4fThtQdWn3xhFAQiNQHTyac9LRUYRpeAyyO6mhsb2bPhlBxM+D1q9IExJi2oTmG+8Da0izy1YArRv1ra8/laK+8LVpv/1CR+ChIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i+CoVNPc; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i+CoVNPc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso6556085a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 02:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784539263; cv=none;
        d=google.com; s=arc-20260327;
        b=eGdQNxwk5oq1Xk1x/q7t6XoHpeLyNoH27Tp7M52D8Oc3cOZtXxveJMGUjrxJvB797P
         zefCkavFpqI+BodzNsMJthcKEh0P2YNGW0iw80x0lMEaXkwjQT9JHEleZ/7s6edjyFhV
         VHz1NkfmMZCg7PVRmiF1Of4P/N4afKK7KbatLnkx/TPPRRm/gdMxYa4a+/vURmojnsLa
         SLgOTfBnkpraCGeZvWuLo7YZLOxBadbonPTgNRxjNBwaN9Bb1T38Ux1BvqeQIgALFx3A
         Vv8qEYCPTPdOXEBdHt4BOeXFLrE4CIzr0pXK5/PIcc2Lwo9L2Gdraw8RnD+1ecNJx0a1
         iPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        fh=4nJYHeB81JL7yBgGUNehVtwNRX3z0KpvqufdmbYAcUg=;
        b=ofmsefStnl9+cCs4mndvk5HSe3ndXEWd1QXd1c8XCfgsbjRRedJgGOFoaVAj39tnAR
         6lNOWo9eWiL163sIAhzON26NwU/ydCFUDV6h5cxYeBCBpw4CL6K02gHamL26l6k5nQxN
         PWvsuvmlK22M1cPc0ts4bMdluW373wETZhg6OnNuzKokJEGwD/HBiIxkSSS+t+QDzK42
         aKLnw0hL12Rtc178hWyn/gJjaplpClhfoFPzvvQhm2G90x2h72ApGd7wI5ZQlYXSWK4I
         o1B/148RxnGxqJFOuDLBpn57AZS5ONmMfr+FJHw1vvbHjYbUOeaXl1rLg2/m3sM2mOBe
         JXyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784539263; x=1785144063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=i+CoVNPcEF4692zQB9BFHcvqmKvGytD/jPQlYkpeCfP/oZOQoybamziGw1XZJTrMM4
         RHtaxDJqwQIMg2ngyUhxt+z5LIFOXcidysjn3k6t7/WNtYEcMslpur1W2gpNqZxfCsgm
         Sv0+gy4yGQNRM6YPmFOrK3b6WO4F6fM7Tvd4pdboinDfKIMOjdS9fkkZJqYWu7NE7mW4
         fp3xDHGRElSfycMWCTVM9JoHYphgwhro7k6ohFSgp5qxkKeFXDPjvTzRj4WDN5WQAMDk
         0YYAP2PcvQx7aHOnTAyvmi0+bBwDksg0HorH8qgQhp9WXZ9dPV4OySaBibxRWRrzKnlH
         MU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539263; x=1785144063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=nl2M7bkbBIU9ZCnEeVn9SuPCmeAPK35D06yGwTbyJ7yUQ4Xx89e/ouJ1Z+svoo3ods
         OvJGWyU7WViVOUOu24QMoIcF0i+EL8QmH2gNLQVzNkb1jZOXVXAzbKfjH6hBOCfeZiOa
         fcA9trCR+ChP9svJzlJQG51kuNsP5G8JhsOcaToEdnfvsmNwhSsZOJ6K1EEwDoxnLHKn
         P0taRRJh5BkQHgpHA7u/3A9QPTlrRp4NqJa/D+n+1ZF9bGqlv0UemoEJY9+stQYmmI3A
         LnWw5DfIvIUyzI+2I5fR3ahRSWWF2stX9EsP7BIN4sCVD5MNAlUMt3wzqAyrOV12Z6Jt
         ay5Q==
X-Gm-Message-State: AOJu0YxidlL/RfBn2s0nEZ0ny/7uQV/gOBdN2FEK3LLkeiev4sNENQ/T
	c1//OUMRjdETfJNaHTwGCSPAtkqiuvrFLjY7OuYhAenIqUTBN+fmwgIVzcXkNg6yMvfshyO/KSf
	3XOFnicfSFhXLUy0v9kyQwEP5hLCJQwnETVXb3Yn/0hfspPv4IQYcJWBVUQ==
X-Gm-Gg: AfdE7cmVhs94mUcARdWOKNe1bjLm3eY3YH0u9Ty1FqZAoORx5+lmhxqA9dfawA1m938
	zDZYtH1VtO4EBZTLE7N+/8DbALXhIIQTSDVDU6858vUdXJV/lG48tW6GNN7HgO/TizRdBsrWmg0
	j0OA7ulRJ8DOHteVs9hqcd8caQQXzlWBQSxfjZJW6V23X69VL41kufazCdyTxFl73R15KQprM7/
	HC8zi22tn8EbllkjupYZQoZJwhVIsapvvIxWCV5oQSvWX/rcmV6s2zTLUQGztg=
X-Received: by 2002:a05:6a00:3d4b:b0:848:7784:37d6 with SMTP id
 d2e1a72fcca58-84c295526eemr13782465b3a.58.1784539263267; Mon, 20 Jul 2026
 02:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-pwm_meson_convert_to_waveform_api-v1-1-d7dbdae1318d@baylibre.com>
 <20260717192735.3E71E1F000E9@smtp.kernel.org>
In-Reply-To: <20260717192735.3E71E1F000E9@smtp.kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 20 Jul 2026 11:20:50 +0200
X-Gm-Features: AUfX_myvcar7qwuq7Xpd8sJoS8D_uPqo1YRJ3UYnt0Ec3GkeZR_OjanqrOWTVXw
Message-ID: <CAFGrd9rnPVAhiTJi964t0AH=1S8sjDWhy1U2iBs3aaQ=zk+85A@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Convert to waveform API
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 9:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Truncation error in hardware waveform quantization breaks legacy=
 polarity inversion.
> - [Medium] Independent rounding in waveform readback produces an invalid =
state where duty + offset > period.
> --
...
> > +     if (meson->data->has_polarity && duty_cnt) {
> > +             u64 offset_cnt =3D mul_u64_u64_div_u64(fin_freq, wf->duty=
_offset_ns,
> > +                                                  NSEC_PER_SEC);
> > +
> > +             /*
> > +              * Waveforms with duty_offset_ns + duty_length_ns =3D=3D
> > +              * period_length_ns are implemented by inverting the outp=
ut:
> > +              * The signal then is low for hi counts (the offset) foll=
owed
> > +              * by high for lo counts (the duty cycle). Other nonzero
> > +              * duty_offset_ns values are rounded down to 0.
> > +              */
> > +             if (offset_cnt && duty_cnt + offset_cnt >=3D cnt) {
>
> [Severity: High]
> Could integer division truncation cause this check to fail for inverted
> waveforms?
>
> If duty_cnt and offset_cnt are calculated with independent truncation, th=
eir
> sum might end up strictly less than cnt even when the original lengths su=
m to
> the period.
>
> Would this cause the driver to incorrectly fall back to normal polarity w=
ith a
> zero offset?
>

At a sub-count boundary floor(duty) + floor(offset) can be cnt - 1 instead =
of
cnt, so an inverted request can indeed fall back to a non-inverted setting =
with
duty_offset rounded down to 0. That is a valid result, not a failure:
.round_waveform_tohw() must round every quantity down and only has to retur=
n a
waveform not exceeding the request (see the contract above
pwm_set_waveform_might_sleep() and pwm_check_rounding() in drivers/pwm/core=
.c).
duty_offset 0 <=3D requested duty_offset, so the result stays within the co=
ntract
and CONFIG_PWM_DEBUG accepts it.

The same count-based test is used by pwm-stm32.c (duty_ticks + offset_ticks=
 >=3D
arr + 1). So the conservative count-based check is intentional. No change.

> > +     /*
> > +      * wfhw->hi and wfhw->lo are u16, so their sum doesn't overflow a=
nd
> > +      * NSEC_PER_SEC * (hi + lo) fits into the u64 dividend in
> > +      * meson_pwm_cnt_to_ns().
> > +      */
> > +     wf->period_length_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wfhw->hi=
 + wfhw->lo);
> > +
> > +     if (wfhw->inverted && wfhw->lo =3D=3D 0) {
> > +             /*
> > +              * The output is constant low. Report a normal constant-l=
ow
> > +              * waveform instead of duty_offset_ns =3D=3D period_lengt=
h_ns
> > +              * which wouldn't be a valid waveform description. This
> > +              * setting is only reachable when the hardware was progra=
mmed
> > +              * by the bootloader as .round_waveform_tohw() never prod=
uces
> > +              * it.
> > +              */
> > +             wf->duty_length_ns =3D 0;
> > +             wf->duty_offset_ns =3D 0;
> > +     } else if (wfhw->inverted) {
> > +             wf->duty_length_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wf=
hw->lo);
> > +             wf->duty_offset_ns =3D meson_pwm_cnt_to_ns(wfhw->rate, wf=
hw->hi);
>
> [Severity: Medium]
> Since meson_pwm_cnt_to_ns() explicitly rounds up, can rounding duty_lengt=
h_ns
> and duty_offset_ns independently result in their sum exceeding
> period_length_ns?
>
> For example, if rate is 333333333 Hz and both hi and lo counts are 1,
> period_length_ns rounds up to 7 ns, while duty_length_ns and duty_offset_=
ns
> would each round up to 4 ns. Their sum (8 ns) would exceed the period len=
gth,
> potentially leading to integer underflow in consumers attempting to calcu=
late
> the remaining period time.

duty_offset_ns + duty_length_ns > period_length_ns is not an invalid wavefo=
rm.
The waveform API requires only duty_length_ns <=3D period_length_ns and
duty_offset_ns < period_length_ns (pwm_wf_valid() in drivers/pwm/core.c); t=
he
sum is deliberately allowed to exceed the period and represents the high ph=
ase
wrapping past the period end, i.e. inverted polarity (see the kerneldoc on
struct pwm_waveform in include/linux/pwm.h). For the example {period 7, dut=
y 4,
offset 4} both invariants hold (4 <=3D 7, 4 < 7), so it is valid.

The core handles it explicitly: pwm_wf2state() maps
duty_length + duty_offset >=3D period to PWM_POLARITY_INVERSED with
duty_cycle =3D period - duty_length =3D 3 ns, so there is no underflow. Rou=
nding
each reported value up independently is what pwm-stm32.c, pwm_th1520.rs and
pwm-axi-pwmgen.c do as well; it is required so that feeding the reported
waveform back through .round_waveform_tohw() reproduces the same counters.
No change.

Alexandre Mergnat
