use DjSmartHealthFilament;

class WearableService {
    private $filament;

    public function __construct(DjSmartHealthFilament $filament) {
        $this->filament = $filament;
    }
}
