Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595879;
	b=ZzXm1FPfNXzqY7+oEYe4EX/PNvhrMl5PtIadebJT1oLlVF2YUYij1dPNBJXrucdrl2v/
	 HqOBacVSEEZBGn6yN1MMgU3Ef+ZyiLYFW+XnZHyjSDCVXupSLdf4SghhErO7k/IfJq/2u
	 gyCQxDWrqy3kfH2B2ELSqubepJFP0No5B7OkR9GH/e96qhtguYqKb3Goos8zgsftgVM2L
	 sbbaA2m7QL4mefI97FSkc5NSDRM/5M9J4QBkwJyaKzR0qxHX1pJbacj7dVSYigQU1evDa
	 MUGYPxTCWwLLCnL6XnHp4JscylDTeDVD44loJ7hCn5u3V0lU9MCppR01sSPkhfXEaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595879;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=i/xsAik0AiF4ZhaovobbhwcQ+i52DTyZxtRC73POBos=;
	b=g5cJZm8yOOk3bMH+Kew2ML/ajyxSBw86Yk8NVb7tf+gVf5szl19I/wEgE6laYlHhy4lN
	 HAZ8+h85doW9d812eHAvPMFDE98udK0I9uJr5kH2gOVqDv8uO0eNKKf0dxFAbgwgePqWB
	 gC+DrxvE2NzAp7o41a4QW/vFOb9YOge6J63b6vnYGShaPaWTqcOs/aCkZjwbfc6gMaeH/
	 DIxoUrQYMQ/pOeMyfpWG1lGGRmZnvHNHJzNKLmCE7U1YfsXQvEHnUe+9kAGRG47LpbImH
	 oFC35w8/+c4wrIaJ7/6AHwyPazahukL3DDJpYpZ0RVIXOeQxtRs2Kbol/3tB/YxvOnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=avNFwwVf;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5E60A260A
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 15:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E5E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=avNFwwVf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8085C5CD75
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 15:18:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C96DD606E3;
	Wed, 21 Oct 2026 15:17:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EB23103289F5;
	Wed, 21 Oct 2026 17:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792595875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i/xsAik0AiF4ZhaovobbhwcQ+i52DTyZxtRC73POBos=;
	b=avNFwwVfRBX6qEdr+In6mRaZPHt5OPunp7ZLlNfwbmtnGNa2jkshcYshINSic2K5kqC90b
	27xYzxzKrRG5rIU1VQHPCp0e8zGH9zXhVJoOnQVgI2nJ+c1J24mvEMDuscWDxxNl3ERPF/
	QB3oituci9pxbdmCZEU2l1H92eBhnLIfzZ6BpxPQSY3K38Q3p5nDtsIoOPXAe5LYE5IHJ/
	YARxJmml2qze3AWoMRCPjef/9beV8ryYbHi1KI53jj+djNmKxO1f78NPntka5IVV7WvfId
	XD6dxVGdSj/oaWYNK6saTQhoIyGUGfMh+mZ91jGPvHbParb4fY1VxzjqLuFWPA==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 17:17:53 +0200
Message-Id: <DMAM7BSH2RV7.7DWVA3SLFF5N@bootlin.com>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 3/5] regulator: core: Add mechanism to force disable a
 regulator at boot
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
 <sashiko-outbox-180119@kernel.org>
In-Reply-To: <sashiko-outbox-180119@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 21, 2026 at 12:46 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] regulator: core: missing mutual exclusion for boot_force_off in =
set_machine_constraints()
> - [High] regulator: core: boot_force_off is a no-op for GPIO-controlled r=
egulators
> - [Medium] regulator: core: boot_force_off works around consumer API misu=
se
> - [Low] regulator: missing kernel-doc for boot_force_off in struct regula=
tion_constraints
> --
>
> commit 934802b5e041e184ae3df8fc8a423b7e086bf66c
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> regulator: core: Add mechanism to force disable a regulator at boot
>
> This commit adds the regulator-boot-force-off device tree property and th=
e
> corresponding boot_force_off constraint flag to disable a regulator in
> set_machine_constraints() during registration.
>
>> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
>> index 14422cfe80e2d..b45048ec084a1 100644
>> --- a/drivers/regulator/core.c
>> +++ b/drivers/regulator/core.c
>> @@ -1450,6 +1450,81 @@ static int handle_notify_limits(struct regulator_=
dev *rdev,
>> =20
>>  	return ret;
>>  }
>> +
>
> [ ... ]
>
>> +static int _regulator_do_disable(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +
>> +	trace_regulator_disable(rdev_get_name(rdev));
>> +
>> +	if (rdev->ena_pin) {
>> +		if (rdev->ena_gpio_state) {
>> +			ret =3D regulator_ena_gpio_ctrl(rdev, false);
>> +			if (ret < 0)
>> +				return ret;
>> +			rdev->ena_gpio_state =3D 0;
>> +		}
>> +
>> +	} else if (rdev->desc->ops->disable) {
>> +		ret =3D rdev->desc->ops->disable(rdev);
>> +		if (ret !=3D 0)
>> +			return ret;
>> +	}
>> +
>> +	if (rdev->desc->off_on_delay)
>> +		rdev->last_off =3D ktime_get_boottime();
>> +
>> +	trace_regulator_disable_complete(rdev_get_name(rdev));
>> +
>> +	return 0;
>> +}
>
> [Severity: High]
> Does boot_force_off work for regulators that use an enable gpio
> (rdev->ena_pin)?
>
> During regulator_register(), rdev is zero-allocated and
> regulator_ena_gpio_request() attaches rdev->ena_pin without setting
> rdev->ena_gpio_state. When regulator_register() -> set_machine_constraint=
s()
> calls _regulator_do_disable(rdev) for boot_force_off (with always_on and
> boot_on unset), rdev->ena_gpio_state is still 0.
>
> In _regulator_do_disable(), when rdev->ena_pin is present and
> rdev->ena_gpio_state is 0, the code skips regulator_ena_gpio_ctrl(rdev, f=
alse)
> and also skips the else-if branch for rdev->desc->ops->disable(rdev).
>
> Won't this leave gpio-controlled regulators enabled in hardware at boot?

Yes, any idea why there is a state instead of turning off the gpio instead =
?

>
>> +
>>  /**
>>   * set_machine_constraints - sets regulator constraints
>>   * @rdev: regulator source
>> @@ -1701,6 +1776,12 @@ static int set_machine_constraints(struct regulat=
or_dev *rdev,
>>  		rdev->last_off =3D ktime_get();
>>  	}
>> =20
>> +	if (rdev->constraints->boot_force_off) {
>> +		ret =3D _regulator_do_disable(rdev);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>>  	if (!rdev->constraints->pw_budget_mW)
>>  		rdev->constraints->pw_budget_mW =3D INT_MAX;
>> =20
>
> [Severity: High]
> What happens in set_machine_constraints() if boot_force_off is set togeth=
er
> with always_on or boot_on?
>
> Neither of_get_regulation_constraints() nor set_machine_constraints() pre=
vents
> boot_force_off from being active at the same time as always_on or boot_on
> (including when set_machine_constraints() implicitly sets
> rdev->constraints->always_on =3D true when !rdev->ena_pin && !ops->enable=
).
>
> Right before this boot_force_off check, set_machine_constraints() handles
> always_on and boot_on:
>
> drivers/regulator/core.c:set_machine_constraints() {
> 	if (rdev->constraints->always_on || rdev->constraints->boot_on) {
> 		...
> 		if (rdev->supply &&
> 		    (rdev->constraints->always_on ||
> 		     !regulator_is_enabled(rdev->supply))) {
> 			ret =3D (is_locked
> 			       ? _regulator_enable(rdev->supply)
> 			       : regulator_enable(rdev->supply));
> 			...
> 			supply_enabled =3D true;
> 		}
>
> 		ret =3D _regulator_do_enable(rdev);
> 		...
> 		if (rdev->constraints->always_on)
> 			rdev->use_count++;
> 	}
> }
>
> Because boot_force_off is checked in a separate conditional afterwards,
> set_machine_constraints() will enable rdev->supply and rdev, and then
> immediately call _regulator_do_disable(rdev).
>
> If _regulator_do_disable(rdev) fails after rdev->supply was enabled,
> set_machine_constraints() returns the error without disabling rdev->suppl=
y,
> and regulator_register() jumps to the wash cleanup path:
>
> drivers/regulator/core.c:regulator_register() {
> wash:
> 	regulator_put(rdev->supply);
> }
>
> which triggers the warning in _regulator_put() and leaks the supply enabl=
e
> count:
>
> drivers/regulator/core.c:_regulator_put() {
> 	/* Docs say you must disable before calling regulator_put() */
> 	WARN_ON(regulator->enable_count);
> }
>
> And if _regulator_do_disable(rdev) succeeds when always_on or boot_on is =
set,
> the hardware output is disabled while rdev->use_count remains 1 (for
> always_on, preventing subsequent regulator_enable() calls from re-enablin=
g the
> hardware) and rdev->supply remains enabled with an unbalanced enable_coun=
t.
>
> Should boot_force_off be mutually exclusive with always_on and boot_on?

Yes probably.
What was on my mind mind is that the boot_force_off property has higher
priority. But this is not documented / I don't know if it is an acceptable
behavior.

>
> [ ... ]
>
>> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_reg=
ulator.c
>> index 09e26febfc834..337629be58ca7 100644
>> --- a/drivers/regulator/of_regulator.c
>> +++ b/drivers/regulator/of_regulator.c
>> @@ -132,6 +132,7 @@ static int of_get_regulation_constraints(struct devi=
ce *dev,
>>  	constraints->always_on =3D of_property_read_bool(np, "regulator-always=
-on");
>>  	if (!constraints->always_on) /* status change should be possible. */
>>  		constraints->valid_ops_mask |=3D REGULATOR_CHANGE_STATUS;
>> +	constraints->boot_force_off =3D of_property_read_bool(np, "regulator-b=
oot-force-off");
>> =20
>>  	constraints->pull_down =3D of_property_read_bool(np, "regulator-pull-d=
own");
>>  	constraints->system_critical =3D of_property_read_bool(np,
>
> [Severity: Medium]
> Is a new device tree property the right way to handle consumers that want=
 to
> disable a boot-enabled regulator during probe?
>
> In the regulator framework, regulator_enable() and regulator_disable() ca=
lls
> on a standard consumer handle must be balanced because regulator_get()
> initializes regulator->enable_count to 0 regardless of hardware state.
>
> For consumers that have exclusive control of a supply and need to turn of=
f a
> regulator that was left enabled at boot without a prior regulator_enable(=
),
> regulator_get_exclusive() already syncs use_count and enable_count with t=
he
> hardware state in _regulator_get_common():
>
> drivers/regulator/core.c:_regulator_get_common() {
> 	if (get_type =3D=3D EXCLUSIVE_GET) {
> 		rdev->exclusive =3D 1;
>
> 		ret =3D _regulator_is_enabled(rdev);
> 		if (ret > 0) {
> 			rdev->use_count =3D 1;
> 			regulator->enable_count =3D 1;
> }
>
> Could the affected consumer driver use regulator_get_exclusive() (or
> devm_regulator_get_exclusive()) instead of adding regulator-boot-force-of=
f to
> device tree?
>
>> diff --git a/include/linux/regulator/machine.h b/include/linux/regulator=
/machine.h
>> index 1fc440c5c4c7e..35ab9de96e5c7 100644
>> --- a/include/linux/regulator/machine.h
>> +++ b/include/linux/regulator/machine.h
>> @@ -227,7 +227,8 @@ struct regulation_constraints {
>>  	unsigned int active_discharge;
>> =20
>>  	/* constraint flags */
>> -	unsigned always_on:1;	/* regulator never off when system is on */
>> +	unsigned always_on:1;		/* regulator never off when system is on */
>> +	unsigned boot_force_off:1;	/* force regulator off at boot */
>>  	unsigned boot_on:1;	/* bootloader/firmware enabled regulator */
>>  	unsigned apply_uV:1;	/* apply uV constraint if min =3D=3D max */
>>  	unsigned ramp_disable:1; /* disable ramp delay */
>
> [Severity: Low]
> Struct regulation_constraints in include/linux/regulator/machine.h has a
> kernel-doc comment block above the definition describing its fields. Shou=
ld an
> @boot_force_off entry be added there as well to avoid a kernel-doc warnin=
g?





--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

